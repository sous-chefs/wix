# First install WiX v3.6
wix_download_id  = '482066'
wix_checksum     = '3b0783c3d295cb21a24f3fee68ad7929989771d145c5ac92acc4bc68cf7163b4'
download_path    = File.join(Chef::Config[:file_cache_path], "wix-#{wix_download_id}.zip")

remote_file download_path do
  source CodePlex.download_url('wix', wix_download_id)
  checksum wix_checksum
  notifies :unzip, "windows_zipfile[unzip-wix-#{wix_download_id}]", :immediately
end

windows_zipfile "unzip-wix-#{wix_download_id}" do
  path node['wix']['home']
  source download_path
  action :nothing
end

# now perform an upgrade to v3.10
node.set['wix']['download_id'] = '1483378'
node.set['wix']['checksum']    = 'b92d1555a1cedb4cf96c319dd60254bac8e7f6e5d85167b12e9fbfbc1bac87ab'

include_recipe 'wix::default'
