#
# Cookbook Name:: newrelic
# Recipe:: nginx_agent
#
# Copyright 2013, Devinder Khroad
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
#


template "#{node[:nginx][:dir]}/sites-available/newrelic_nginx_agent" do
  source "nginx_site.erb"
  owner "root"
  group "root"
  mode 00644
end

nginx_site "newrelic_nginx_agent" do
  enable true
end

newrelic_monitoring_ruby_plugin_agent node[:newrelic_monitoring][:nginx_agent][:name]  do
  source  node[:newrelic_monitoring][:nginx_agent][:source]
  start_command node[:newrelic_monitoring][:nginx_agent][:start_cmd]
  stop_command node[:newrelic_monitoring][:nginx_agent][:stop_cmd]
  config_dir   node[:newrelic_monitoring][:nginx_agent][:config_dir]
  action [ :install, :configure, :run]
end



  

