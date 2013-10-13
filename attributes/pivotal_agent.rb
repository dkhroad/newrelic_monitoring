default[:newrelic_monitoring][:pivotal_agent][:name] = "pivotal_agent" 
default[:newrelic_monitoring][:pivotal_agent][:source] =  'https://github.com/gopivotal/newrelic_pivotal_agent/archive/pivotal_agent-1.0.4.tar.gz'
default[:newrelic_monitoring][:pivotal_agent][:config_dir] = "config"
default[:newrelic_monitoring][:pivotal_agent][:start_cmd] = "pivotal_agent.daemon start" 
default[:newrelic_monitoring][:pivotal_agent][:stop_cmd] = "pivotal_agent.daemon stop" 
