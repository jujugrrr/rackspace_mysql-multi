# Encoding: utf-8
name             'rackspace_mysql-multi'
maintainer       'Rackspace'
maintainer_email 'rackspace-cookbooks@rackspace.com'
license          'Apache 2.0'
description      'Installs/Configures rackspace_mysql-multi'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.3.0'

depends 'phpstack'
depends 'elkstack'
depends 'java'
depends 'chef_handler'
depends 'apt'
depends 'yum'
depends 'database'
depends 'mysql-multi'
