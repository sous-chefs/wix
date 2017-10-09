#
# Author:: Seth Chisamore (<schisamo@chef.io>)
# Cookbook:: wix
# Attributes:: default
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

default['wix']['checksum'] = 'da034c489bd1dd6d8e1623675bf5e899f32d74d6d8312f8dd125a084543193de'

default['wix']['home'] = "#{ENV['SYSTEMDRIVE']}\\wix"
