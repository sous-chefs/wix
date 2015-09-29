WIX Cookbook
============
[![Build Status](https://travis-ci.org/chef-cookbooks/wix.svg?branch=master)](http://travis-ci.org/chef-cookbooks/wix)
[![Cookbook Version](https://img.shields.io/cookbook/v/wix.svg)](https://supermarket.chef.io/cookbooks/wix)


The [Windows Installer XML](http://wix.sourceforge.net/) (WiX) is a toolset
that builds Windows installation packages from XML source code. The toolset
supports a command line environment that developers may integrate into their
build processes to build MSI and MSM setup packages. This cookbook installs the
full WiX suite of tools.

Requirements
------------
#### Platforms
* Windows Server 2003 R2
* Windows 7
* Windows Server 2008 (R1, R2)

#### Cookbooks
- windows


Attributes
==========

* `node['wix']['home']` - location to install WiX files to.  default is
  `%SYSTEMDRIVE%\wix`
* `node['wix']['download_id']` - CodePlex download id of the WiX binaries to
   install. default is `1483378` (WiX v3.10)
* `node['wix']['checksum']` - SHA256 of the WiX binaries zip file. default is
  `b92d1555a1cedb4cf96c319dd60254bac8e7f6e5d85167b12e9fbfbc1bac87ab`

Usage
=====

default
-------

Downloads and installs WiX to the location specified by `node['wix']['home']`.
Also ensures `node['wix']['home']` is in the system path.

License & Authors
-----------------

**Author:** Cookbook Engineering Team (<cookbooks@chef.io>)

**Copyright:** 2011-2015, Chef Software, Inc.
```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
