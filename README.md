# rackspace_mysql-multi


## [Changelog](CHANGELOG.md)

See CHANGELOG.md for additional information about changes to this stack over time.

## Supported Platforms

CentOS 6.5
Ubuntu 12.04

Requirements
------------
#### Cookbooks
* Look at metadata

## Attributes

default['rackspace_mysql-multi']['holland']['enabled'] = true => deploy holland backup
default['rackspace_mysql-multi']['holland']['password'] = 'notagudpassword' => change it to the password oyu want
default['rackspace_mysql-multi']['holland']['cron']['day'] = '*' => every day
default['rackspace_mysql-multi']['holland']['cron']['hour'] = '3' => at 3am
default['rackspace_mysql-multi']['holland']['cron']['minute'] = '12' => and 12mins

## Usage

### rackspace_mysql-multi::mysql_master

Deploy a mysql master node

### rackspace_mysql-multi::mysql_slave

Deploy a mysql slave node

### rackspace_mysql-multi::holland

Deploy holland backup



## Contributing

https://github.com/rackspace-cookbooks/contributing/blob/master/CONTRIBUTING.md

## Authors

Author:: Rackspace (devops-chef@rackspace.com)

## License
```
# Copyright 2014, Rackspace Hosting
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
```
