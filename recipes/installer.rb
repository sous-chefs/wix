# encoding: UTF-8
# Author:: Shawn Weitzel(<sweitzel74@gmail.com>)
# Cookbook Name:: wix
# Recipe:: installer
#
# Copyright 2014, Changepoint Corporation.
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

include_recipe 'dotnetframework'

download_url = CodePlex.download_url('wix', node['wix']['installer_download_id'])
file_name = node['wix']['installer_file_name']

remote_file "#{Chef::Config[:file_cache_path]}/#{file_name}" do
  source download_url
  checksum node['wix']['installer_checksum']
  notifies :install, "windows_package[#{node['wix']['package_name']}]", :immediately
end

windows_package node['wix']['package_name'] do
  source "#{Chef::Config[:file_cache_path]}/#{file_name}"
  checksum node['wix']['installer_checksum']
  installer_type :custom
  options '/quiet /log wixinstall.log'
  action :nothing
end
