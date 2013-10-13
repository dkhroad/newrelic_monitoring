
default[:newrelic_monitoring][:railsware][:resque_agent][:name] = "resque_agent" 
default[:newrelic_monitoring][:railsware][:resque_agent][:gem_name] = "newrelic_resque_agent" 

default[:newrelic_monitoring][:railsware][:resque_agent][:start_cmd] = "resque_agent.daemon start" 
default[:newrelic_monitoring][:railsware][:resque_agent][:stop_cmd] = "resque_agent.daemon stop" 
default[:newrelic_monitoring][:railsware][:resque_agent][:status_cmd] = "resque_agent.daemon status"
