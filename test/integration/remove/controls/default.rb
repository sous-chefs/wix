# frozen_string_literal: true

control 'removed-wix-cli' do
  impact 1.0
  title 'Uninstall WiX and its machine environment entries'
  desc 'The MSI removes its owned files and PATH/WIX7 entries while preserving shared component ownership.'

  describe package('WiX Toolset Command-Line Tools') do
    it { should_not be_installed }
  end

  describe file('C:/Program Files/WiX Toolset v7.0/bin/wix.exe') do
    it { should_not exist }
  end

  describe command("[Environment]::GetEnvironmentVariable('Path', 'Machine')") do
    its('stdout.downcase') { should_not include 'wix toolset v7.0' }
  end

  describe command("[Environment]::GetEnvironmentVariable('WIX7', 'Machine')") do
    its('stdout.strip') { should eq '' }
  end
end
