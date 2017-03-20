
%w(
  candle.exe
  heat.exe
  light.exe
).each do |utility|
  describe file("C:/wix/#{utility}") do
    it { should be_file }
  end
end

describe os_env('PATH') do
  its('split') { should include('C:\wix') }
end
