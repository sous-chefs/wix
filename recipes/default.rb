#
# Author:: Seth Chisamore (<schisamo@chef.io>)
# Cookbook:: wix
# Recipe:: default
#
# Copyright:: 2011-2017, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

download_url  = 'https://github.com/wixtoolset/wix3/releases/download/wix311rtm/wix311-binaries.zip'
download_path = File.join(Chef::Config[:file_cache_path], 'wix311-binaries.zip')

remote_file download_path do
  source download_url
  checksum node['wix']['checksum']
  notifies :unzip, "windows_zipfile[#{node['wix']['home']}]", :immediately
end

windows_zipfile node['wix']['home'] do
  source download_path
  overwrite true
  action :nothing
end

# update path
windows_path node['wix']['home'] do
  action :add
end
