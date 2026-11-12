# frozen_string_literal: true

require 'spec_helper'

describe 'wix_install' do
  step_into :wix_install
  platform 'windows', '2022'

  recipe do
    wix_install 'WiX'
  end

  it 'installs the verified current MSI into the selected home' do
    expect(chef_run).to install_windows_package('WiX Toolset Command-Line Tools')
      .with(source: 'https://github.com/wixtoolset/wix/releases/download/v7.0.1/wix-cli-x64.msi',
            checksum: '93673c89ab33b1fd3f07ad5e609b7cae694bd716b2914259b61a41c02303b64c',
            version: '7.0.1.0', installer_type: :msi,
            options: 'INSTALLFOLDER="C:/Program Files/WiX Toolset v7.0"', returns: [0, 3010])
  end

  it 'leaves usage agreement acceptance explicit' do
    expect(chef_run).not_to run_execute('accept WiX OSMF EULA')
  end

  context 'explicit agreement acceptance' do
    recipe do
      wix_install 'WiX' do
        accept_eula true
      end
    end

    it 'uses the upstream CLI gesture and guards the per-user acceptance file' do
      expect(chef_run).to run_execute('accept WiX OSMF EULA')
        .with(command: '"C:/Program Files/WiX Toolset v7.0/bin/wix.exe" eula accept wix7',
              creates: ::File.join(::Dir.home, '.wix', 'wix7-osmf-eula.txt'))
    end
  end

  context 'private package and home' do
    recipe do
      wix_install 'WiX' do
        version '7.0.2'
        source 'https://packages.example/wix.msi'
        checksum 'a' * 64
        home 'C:/Build Tools/WiX'
      end
    end

    it 'uses the caller-supplied source, checksum, version and path' do
      expect(chef_run).to install_windows_package('WiX Toolset Command-Line Tools')
        .with(source: 'https://packages.example/wix.msi', checksum: 'a' * 64,
              version: '7.0.2.0', options: 'INSTALLFOLDER="C:/Build Tools/WiX"')
    end
  end

  context 'removal' do
    recipe do
      wix_install 'WiX' do
        action :remove
      end
    end

    it 'uses the registered MSI uninstaller without fetching the installer' do
      expect(chef_run).to remove_windows_package('WiX Toolset Command-Line Tools')
        .with(installer_type: :msi, returns: [0, 3010])
      expect(chef_run.windows_package('WiX Toolset Command-Line Tools').source).to be_nil
    end
  end

  context 'an unverified version' do
    recipe do
      wix_install 'WiX' do
        version '7.0.2'
      end
    end

    it 'requires an explicit checksum' do
      expect { chef_run }.to raise_error(ArgumentError, /Set checksum/)
    end
  end
end
