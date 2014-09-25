# Encoding: utf-8
#
# Cookbook Name:: rackspace_mysql-multi
# Recipe:: default
#
# Copyright 2014, Rackspace
#

include_recipe 'database::mysql'

# add holland user
mysql_database_user 'holland' do
  connection(
  host: 'localhost',
  username: 'root',
  password: node['mysql']['server_root_password']
  )
  password node['holland']['password']
  host 'localhost'
  privileges [:usage, :select, :'lock tables', :'show view', :reload, :super, :'replication client']
  retries 2
  retry_delay 2
  action [:create, :grant]
end

# set repository
case node['platform_family']
when 'debian'
  include_recipe 'apt'
  apt_repository 'Holland' do
    uri "http://download.opensuse.org/repositories/home:/holland-backup/x#{node['lsb']['id']}_#{node['lsb']['release']}/"
    key "http://download.opensuse.org/repositories/home:/holland-backup/x#{node['lsb']['id']}_#{node['lsb']['release']}/Release.key"
    components ['./']
    action :add
  end
when 'rhel'
  include_recipe 'yum'
  yum_repository 'Holland' do
    description 'Holland backup repo'
    baseurl 'http://download.opensuse.org/repositories/home:/holland-backup/CentOS_CentOS-6/'
    gpgkey 'http://download.opensuse.org/repositories/home:/holland-backup/CentOS_CentOS-6/repodata/repomd.xml.key'
    action :create
  end
end

# install needed packages
%w(holland holland-mysqldump).each do |pkg|
  package pkg do
    action :install
  end
end

# determine if server is slave or standalone and drop specific backupset file
if node.run_context.loaded_recipe?('rackspace_mysql-multi::mysql_slave')
  template '/etc/holland/backupsets/default.conf' do
    source 'mysql/backup_sets.erb'
    owner 'root'
    group 'root'
    mode 0644
    variables(
      backup_user: 'holland',
      backup_password: node['holland']['password'],
      role: 'slave'
    )
  end
else
  template '/etc/holland/backupsets/default.conf' do
    source 'mysql/backup_sets.erb'
    owner 'root'
    group 'root'
    mode 0644
    variables(
      backup_user: 'holland',
      backup_password: node['holland']['password'],
      role: 'master'
    )
  end
end

# set cronjob
cron 'backup' do
  hour node['holland']['cron']['hour']
  minute node['holland']['cron']['minute']
  day node['holland']['cron']['day']
  command '/usr/sbin/holland bk'
  action :create
end
