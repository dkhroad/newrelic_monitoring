if node['platform_family'] == 'rhel'
  rpm_path = "#{Chef::Config[:file_cache_path]}/#{::File.basename(node['newrelic_monitoring']['nr_sysmond']['package'])}"

  remote_file rpm_path do
    source node['newrelic_monitoring']['nr_sysmond']['repo']
    action :create_if_missing
  end

  package node['newrelic_monitoring']['nr_sysmond']['package'] do
    provider Chef::Provider::Package::Rpm
    source   rpm_path
    action   :install
  end
end

