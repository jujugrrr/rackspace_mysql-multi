# Encoding: utf-8

require_relative 'spec_helper'

describe 'rackspace_mysql-multi::mysql_slave' do
  before { stub_resources }
  let(:chef_run) { ChefSpec::Runner.new(CENTOS_OPTS).converge(described_recipe) }

  it 'includes mysql-multi slave recipe' do
    expect(chef_run).to include_recipe('mysql-multi::mysql_slave')
  end

  it 'includes holland recipe' do
    expect(chef_run).to include_recipe('rackspace_mysql-multi::holland')
  end

  context 'Holland is disabled' do
    let(:chef_run) do
      ChefSpec::Runner.new(CENTOS_OPTS) do |node|
        node.set['rackspace_mysql-multi']['holland']['enabled'] = false
      end.converge(described_recipe)
    end
    it 'doesn\'t include holland recipe' do
      expect(chef_run).to_not include_recipe('rackspace_mysql-multi::holland')
    end
  end
end
