# encoding: UTF-8
describe 'wix::installer' do

  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'should include the dotnetframework' do
    expect(chef_run).to include_recipe 'dotnetframework'
  end

#  it 'should install WiX' do
#    expect(chef_run).to install_windows_package(chef_run.node['wix']['package_name']).with(
#      source: "#{Chef::Config[:file_cache_path]}/#{chef_run.node['wix']['installer_file_name']}",
#      checksum: chef_run.node['wix']['installer_checksum'],
#      action: 'nothing'
#    )
#  end
end
