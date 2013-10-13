
agent_dir = "#{node[:newrelic_monitoring][:agents_install_dir]}/#{node[:newrelic_monitoring][:pivotal_agent][:name]}"

directory agent_dir do 
  mode 00755
  recursive true
end

template "#{agent_dir}/#{node[:newrelic_monitoring][:pivotal_agent][:name]}.daemon" do
  source "pivotal_agent.daemon.erb"
  mode 00755
end

newrelic_monitoring_ruby_plugin_agent "#{node[:newrelic_monitoring][:pivotal_agent][:name]}"  do
  source node[:newrelic_monitoring][:pivotal_agent][:source] 
  config_dir node[:newrelic_monitoring][:pivotal_agent][:config_dir]
  action [ :install, :configure, :run]
  start_command node[:newrelic_monitoring][:pivotal_agent][:start_cmd]
  stop_command node[:newrelic_monitoring][:pivotal_agent][:stop_cmd]
end

