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

default['wix']['url']       = 'http://wixtoolset.org/releases/v3.6.2928.0/wix36-binaries.zip'
default['wix']['checksum']  = 'c90319e4b6f4f1626f9e417f925497fe9b4af0ce221d3d8023f8276468e3044d'

default['wix']['home']    = "#{ENV['SYSTEMDRIVE']}\\wix"
