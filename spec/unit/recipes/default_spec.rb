require 'spec_helper'

describe 'default recipe on Windows 2016' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'windows', version: '2016').converge('wix::default')
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end

describe 'default recipe on Windows 2019' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'windows', version: '2019').converge('wix::default')
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end
