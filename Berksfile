source "https://supermarket.getchef.com"

cookbook 'phpstack', git: 'git@github.com:AutomationSupport/phpstack.git', branch: "feature-flags"
cookbook 'elkstack', git: 'git@github.com:rackspace-cookbooks/elkstack.git'
cookbook 'rackspace_cloudbackup', git: 'git@github.com:rackspace-cookbooks/rackspace_cloudbackup.git'
cookbook 'rackspace_gluster', git: 'git@github.com:rackspace-cookbooks/rackspace_gluster.git'
cookbook 'pg-multi', git: 'git@github.com:rackspace-cookbooks/pg-multi.git'
cookbook 'kibana', '~> 1.3', git:'git@github.com:lusis/chef-kibana.git'

# until https://github.com/elasticsearch/cookbook-elasticsearch/pull/230
cookbook 'elasticsearch', '~> 0.3', git:'git@github.com:racker/cookbook-elasticsearch.git'

# until https://github.com/lusis/chef-logstash/pull/336
cookbook 'logstash', '~> 0.9', git:'git@github.com:racker/chef-logstash.git'

# until https://github.com/poise/python/pull/120
cookbook 'python', git: 'git@github.com:racker/python.git'

group :integration do
  cookbook 'apt'
  cookbook 'yum'
end

metadata
