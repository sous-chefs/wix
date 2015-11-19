
describe script('C:\wix\candle.exe /?') do
  its('stdout') { should include('Windows Installer XML Toolset Compiler version 3.10.0.2103') }
end
