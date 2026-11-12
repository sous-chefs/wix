# frozen_string_literal: true

raise 'Set WIX_ACCEPT_EULA=true only after approving the WiX OSMF EULA for this test account' unless ENV['WIX_ACCEPT_EULA'] == 'true'

wix_install 'WiX build tools' do
  accept_eula true
end

directory 'C:/wix-smoke'

file 'C:/wix-smoke/payload.txt' do
  content 'WiX migration smoke test'
end

file 'C:/wix-smoke/Package.wxs' do
  content <<~XML
    <Wix xmlns="http://wixtoolset.org/schemas/v4/wxs">
      <Package Name="Cookbook Smoke Test" Manufacturer="Sous Chefs" Version="1.0.0" UpgradeCode="{0E52BA6F-6411-43F5-BF64-91B7F517F704}">
        <MediaTemplate EmbedCab="yes" />
        <StandardDirectory Id="ProgramFiles64Folder">
          <Directory Id="INSTALLFOLDER" Name="Cookbook Smoke Test">
            <Component Id="Payload" Guid="*">
              <File Source="C:/wix-smoke/payload.txt" />
            </Component>
          </Directory>
        </StandardDirectory>
        <Feature Id="Main" Level="1"><ComponentRef Id="Payload" /></Feature>
      </Package>
    </Wix>
  XML
end

execute 'build smoke MSI' do
  command '"C:/Program Files/WiX Toolset v7.0/bin/wix.exe" build C:/wix-smoke/Package.wxs -arch x64 -o C:/wix-smoke/smoke.msi'
  creates 'C:/wix-smoke/smoke.msi'
end
