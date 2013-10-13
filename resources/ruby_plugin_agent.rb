actions :install, :configure, :run
default_action :install

attribute :user, kind_of: String, default: node[:newrelic_monitoring][:user]
attribute :group, kind_of: String, default: node[:newrelic_monitoring][:group]
attribute :install_dir, kind_of: String, default: node[:newrelic_monitoring][:agents_install_dir]
attribute :source, kind_of: [String,NilClass]
attribute :gem_source, kind_of: [String,NilClass]
attribute :start_command, kind_of: [String,NilClass]
attribute :stop_command, kind_of: [String,NilClass]
attribute :status_command, kind_of: [String,NilClass]
attribute :config_dir, kind_of: [String,NilClass]

attribute :name,  kind_of: String, name_attribute: true
