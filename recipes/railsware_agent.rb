

agent_dir = "#{node[:newrelic_monitoring][:agents_install_dir]}/#{node[:newrelic_monitoring][:railsware][:resque_agent][:name]}"

directory agent_dir do 
  mode 00755
  recursive true
end

template "#{agent_dir}/#{node[:newrelic_monitoring][:railsware][:resque_agent][:name]}.daemon" do
  source "resque_agent.daemon.erb"
  mode 00755
end

newrelic_monitoring_ruby_plugin_agent node[:newrelic_monitoring][:railsware][:resque_agent][:name] do
  action [ :install, :configure, :run]
  gem_source node[:newrelic_monitoring][:railsware][:resque_agent][:gem_name] 
  config_dir "."
  start_command node[:newrelic_monitoring][:railsware][:resque_agent][:start_cmd]
  stop_command node[:newrelic_monitoring][:railsware][:resque_agent][:stop_cmd]
end

