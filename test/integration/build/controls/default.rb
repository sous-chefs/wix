# frozen_string_literal: true

control 'built-msi' do
  impact 1.0
  title 'Compile a real MSI from the fixture source'
  desc 'The explicitly approved EULA fixture invokes wix build and produces a nonempty Windows Installer package.'

  describe file('C:/wix-smoke/smoke.msi') do
    it { should exist }
    its('size') { should be > 1000 }
  end
end
