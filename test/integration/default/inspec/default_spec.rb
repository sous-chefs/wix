
%w(
  candle.exe
  heat.exe
  light.exe
).each do |utility|
  describe file("C:/wix/#{utility}") do
    it { should be_file }
  end
end

#
# Once https://github.com/chef/inspec/pull/245 is merged we'll be able to
# do this:
#
#   describe os_env('PATH') do
#     its('split') { should include('C:\wix') }
#   end
#
# Until then we can workaround the issue as follows.
#
describe script('$Env:PATH') do
  its('stdout') { should include('C:\wix') }
end
