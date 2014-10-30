#
# Author:: Seth Chisamore (<schisamo@opscode.com>)
# Cookbook Name:: wix
# Attribute:: default
#
# Copyright:: Copyright (c) 2011 Opscode, Inc.
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

# WiX v3.6
default['wix']['binaries_zip_download_id'] =
  '482066'
default['wix']['binaries_zip_checksum'] =
  '3b0783c3d295cb21a24f3fee68ad7929989771d145c5ac92acc4bc68cf7163b4'
default['wix']['binaries_zip_file_name'] =
  'wix-binaries.zip'
default['wix']['installer_download_id'] =
  '482065'
default['wix']['installer_checksum'] =
  '6aca5133d4da7d79ec6a2ca658e67b591545fff5b8721b2a74474e51651ead19'
default['wix']['installer_file_name'] =
  'WiX36.exe'
default['wix']['package_name'] =
  'WiX Toolset v3.6.3303.1'
default['wix']['home'] =
  "#{ENV['SYSTEMDRIVE']}\\wix"
