
  group node[:newrelic_monitoring][:group] 
  user "#{new_resource.user}" do
    action :create
    name  node[:newrelic_monitoring][:user] 
    gid    node[:newrelic_monitoring][:group] 
    system true
    shell  "/bin/bash"
    comment "newrelic monitoring agent user"
    home "/home/#{node[:newrelic_monitoring][:user]}"
    supports manage_home: true
  end
