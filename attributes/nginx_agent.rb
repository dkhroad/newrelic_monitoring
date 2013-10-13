default[:newrelic_monitoring][:nginx_agent][:name] = "nginx_agent"
default[:newrelic_monitoring][:nginx_agent][:source] = "http://nginx.com/download/newrelic/newrelic_nginx_agent.tar.gz"
default[:newrelic_monitoring][:nginx_agent][:port] = 8888
default[:newrelic_monitoring][:nginx_agent][:host] = "127.0.0.1"
default[:newrelic_monitoring][:nginx_agent][:config_dir] = "config"
default[:newrelic_monitoring][:nginx_agent][:start_cmd] = "newrelic_nginx_agent.daemon start" 
default[:newrelic_monitoring][:nginx_agent][:stop_cmd] = "newrelic_nginx_agent.daemon stop" 
default[:newrelic_monitoring][:nginx_agent][:status_cmd] = "newrelic_nginx_agent.daemon status"
