# frozen_string_literal: true

control 'installed-wix-cli' do
  impact 1.0
  title 'Run the current WiX CLI'
  desc 'Verify the MSI installation, executable version and machine environment entries.'

  describe package('WiX Toolset Command-Line Tools') do
    it { should be_installed }
    its('version') { should eq '7.0.1.0' }
  end

  describe command("& 'C:/Program Files/WiX Toolset v7.0/bin/wix.exe' --version") do
    its('exit_status') { should eq 0 }
    its('stdout') { should match(/7\.0\.1/) }
  end

  describe command("[Environment]::GetEnvironmentVariable('Path', 'Machine')") do
    its('stdout.downcase') { should include 'wix toolset v7.0' }
  end

  describe command("[Environment]::GetEnvironmentVariable('WIX7', 'Machine')") do
    its('stdout.downcase') { should include 'wix toolset v7.0' }
  end
end
