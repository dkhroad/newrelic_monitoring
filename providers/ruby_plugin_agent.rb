

def source_is_a_tarball?
  new_resource.source =~ %r{.(tgz|gz)$}
end

def source_is_a_gem?
  new_resource.source.nil? && !new_resource.gem_source.nil?
end

def download_tarball
  remote_file "#{Chef::Config['file_cache_path']}/#{::File.basename(new_resource.source)}" do
    action :create_if_missing
    source new_resource.source
  end
end

def download_gem
  gem_package new_resource.gem_source
end

def download
  download_tarball if source_is_a_tarball?
  download_gem if source_is_a_gem?
end

def extract_tar
  source_path = "#{Chef::Config['file_cache_path']}/#{::File.basename(new_resource.source)}"
  extract_path = "#{new_resource.install_dir}/#{new_resource.name}"

  bash "extract_#{new_resource.name}" do
    code <<-EOH
      tar --strip-components=1 -xvzf #{source_path} -C #{extract_path} 
    EOH
  end

  execute "bundle install_#{new_resource.name}" do 
    command "bundle install"
    cwd "#{new_resource.install_dir}/#{new_resource.name}"
  end

end

def extract_module 
  extract_path = "#{new_resource.install_dir}/#{new_resource.name}"

  directory extract_path do 
    mode 00755
    recursive true
  end
  extract_tar if source_is_a_tarball?

  execute "chown_#{new_resource.name}" do 
    command "chown -R #{new_resource.user}:#{new_resource.group} #{extract_path}"
  end
end

action :install do 
  download 
end

action :configure do 
  extract_module 

  template "#{node[:newrelic_monitoring][:agents_install_dir]}/#{new_resource.name}/#{new_resource.config_dir}/newrelic_plugin.yml" do 
    source "#{new_resource.name}.yml.erb"
    owner "root"
    group "root"
    mode  00644
  end

end

action :run do 
  cmd_prefix = "#{node[:newrelic_monitoring][:agents_install_dir]}/#{new_resource.name}"
  service "newrelic_plugin_#{new_resource.name}" do 
    provider Chef::Provider::Service::Simple
    supports status: true
    start_command "su #{node[:newrelic_monitoring][:user]} -c '#{cmd_prefix}/#{new_resource.start_command}'"
    stop_command "su #{node[:newrelic_monitoring][:user]} -c '#{cmd_prefix}/#{new_resource.stop_command}'"

    subscribes :restart, "#{cmd_prefix}/#{new_resource.config_dir}/newrelic_plugin.yml"
    action :start
  end
end
