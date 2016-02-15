#
# Author:: Seth Chisamore (<schisamo@chef.io>)
# Cookbook Name:: wix
# Attributes:: default
#
# Copyright 2011-2015, Chef Software, Inc.
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

# WiX v3.10.2
default['wix']['download_id'] = '1540241'
default['wix']['checksum']    = '03b8f46cb3abf1465fe8f9975a94a4e0f75c77267ff4d1fcb6d5b6a97567f549'

default['wix']['home'] = "#{ENV['SYSTEMDRIVE']}\\wix"
