# Encoding: utf-8

require_relative 'spec_helper'

describe 'rackspace_mysql-multi::holland' do
  before { stub_resources }

  let(:chef_run) { ChefSpec::Runner.new(CENTOS_OPTS).converge(described_recipe) }

  context 'Ubuntu' do
    let(:chef_run) { ChefSpec::Runner.new(UBUNTU_OPTS).converge(described_recipe) }
    it 'includes apt recipe' do
      expect(chef_run).to include_recipe('apt')
    end
    it 'add holland repository' do
      expect(chef_run).to add_apt_repository('Holland')
    end
  end

  context 'Centos' do
    let(:chef_run) { ChefSpec::Runner.new(CENTOS_OPTS).converge(described_recipe) }
    it 'includes yum recipe' do
      expect(chef_run).to include_recipe('yum')
    end
    it 'add holland repository' do
      expect(chef_run).to create_yum_repository('Holland')
    end
  end

  context 'Slave' do
    let(:chef_run) { ChefSpec::Runner.new(CENTOS_OPTS).converge('rackspace_mysql-multi::mysql_slave', described_recipe) }
    it 'configures holland for a slave' do
      expect(chef_run).to render_file('/etc/holland/backupsets/default.conf').with_content('stop-slave')
    end
  end

  context 'Master/Standalone' do
    let(:chef_run) { ChefSpec::Runner.new(CENTOS_OPTS).converge(described_recipe) }
    it 'configures holland for a master/standalone' do
      expect(chef_run).to_not render_file('/etc/holland/backupsets/default.conf').with_content('stop-slave')
    end
  end

  it 'includes database recipe' do
    expect(chef_run).to include_recipe('database::mysql')
  end

  it 'creates holland DB user' do
    expect(chef_run).to create_mysql_database_user('holland')
    expect(chef_run).to grant_mysql_database_user('holland')
  end

  %w(holland holland-mysqldump).each do |pkg|
    it "installs #{pkg} packages" do
      expect(chef_run).to install_package(pkg)
    end
  end

  it 'sets a cronjob for backups' do
    expect(chef_run).to create_cron('backup').with(minute: '12', hour: '3', day: '*', command: '/usr/sbin/holland bk')
  end

end
