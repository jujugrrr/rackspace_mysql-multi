# Encoding: utf-8

require_relative 'spec_helper'

if os[:family] == 'RedHat'
  describe service('mysqld') do
    it { should be_enabled }
    it { should be_running }
  end
else
  describe service('mysql') do
    it { should be_enabled }
    it { should be_running }
  end
end

describe port(3306) do
  it { should be_listening }
end

describe file('/etc/holland/backupsets/default.conf') do
  it { should be_file }
end

describe cron do
  it { should have_entry '12 3 * * * /usr/sbin/holland bk' }
end
