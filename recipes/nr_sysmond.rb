include_recipe 'newrelic_monitoring::repository'

yum_package 'newrelic-sysmond' do 
  action :install
end

service 'newrelic-sysmond' do
  supports status: true, restart: true
  action :nothing
end

template "#{node[:newrelic_monitoring][:install_dir]}/nrsysmond.cfg" do 
  source "nrsysmond.cfg.erb"
  mode  00644
  notifies :restart, 'service[newrelic-sysmond]'
end

