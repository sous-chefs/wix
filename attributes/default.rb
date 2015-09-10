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

# WiX v3.10
default['wix']['download_id'] = '1483378'
default['wix']['checksum']    = 'b92d1555a1cedb4cf96c319dd60254bac8e7f6e5d85167b12e9fbfbc1bac87ab'

default['wix']['home'] = "#{ENV['SYSTEMDRIVE']}\\wix"
