# Encoding: utf-8
#
# Cookbook Name:: rackspace_mysql-multi
# Recipe:: default
#
# Copyright 2014, Rackspace
#
include_recipe 'mysql-multi::mysql_master'
include_recipe 'rackspace_mysql-multi::holland' if node['rackspace_mysql-multi']['holland']['enabled']
