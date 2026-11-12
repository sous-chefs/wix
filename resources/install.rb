# frozen_string_literal: true

unified_mode true
provides :wix_install

property :version, String, default: '7.0.1'
property :source, String, default: lazy { "https://github.com/wixtoolset/wix/releases/download/v#{version}/wix-cli-x64.msi" }
property :checksum, String, default: lazy {
  raise ArgumentError, 'Set checksum when selecting another WiX version' unless version == '7.0.1'

  '93673c89ab33b1fd3f07ad5e609b7cae694bd716b2914259b61a41c02303b64c'
}
property :package_name, String, default: 'WiX Toolset Command-Line Tools'
property :home, String, default: lazy { "C:/Program Files/WiX Toolset v#{version.split('.')[0, 2].join('.')}" }
property :accept_eula, [true, false], default: false

action :install do
  raise ArgumentError, 'WiX version must contain three numeric components' unless new_resource.version.match?(/\A\d+\.\d+\.\d+\z/)
  raise ArgumentError, 'home cannot contain quotes or newlines' if new_resource.home.match?(/["\r\n]/)

  windows_package new_resource.package_name do
    source new_resource.source
    checksum new_resource.checksum
    version "#{new_resource.version}.0"
    installer_type :msi
    options "INSTALLFOLDER=\"#{new_resource.home.tr('/', '\\')}\" /l*v \"#{::File.join(Chef::Config[:file_cache_path], 'wix-install.log').tr('/', '\\')}\""
    returns [0, 3010]
    action :install
  end

  if new_resource.accept_eula
    execute 'accept WiX OSMF EULA' do
      command "\"#{new_resource.home}/bin/wix.exe\" eula accept wix#{new_resource.version.split('.').first}"
      creates eula_file
    end
  end
end

action :remove do
  windows_package new_resource.package_name do
    installer_type :msi
    returns [0, 3010]
    action :remove
  end
end

action_class do
  def eula_file
    ::File.join(::Dir.home, '.wix', "wix#{new_resource.version.split('.').first}-osmf-eula.txt")
  end
end
