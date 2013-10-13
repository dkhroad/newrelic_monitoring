default[:newrelic_monitoring][:nr_sysmond][:arch] = node['kernel']['machine'] =~ /x86_64/ ? 'x86_64' : 'i386'
default[:newrelic_monitoring][:nr_sysmond][:repo]= "http://download.newrelic.com/pub/newrelic/el5/" + 
                                                    node[:newrelic_monitoring][:nr_sysmond][:arch] + 
                                                    "/newrelic-repo-5-3.noarch.rpm"
default[:newrelic_monitoring][:nr_sysmond][:package] = 'newrelic-sysmond'

