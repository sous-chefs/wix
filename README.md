# WIX Cookbook

[![Build status](https://ci.appveyor.com/api/projects/status/9gekfdko5uyaa3li/branch/master?svg=true)](https://ci.appveyor.com/project/ChefWindowsCookbooks/wix/branch/master) [![Cookbook Version](https://img.shields.io/cookbook/v/wix.svg)](https://supermarket.chef.io/cookbooks/wix)

The [Windows Installer XML](http://wixtoolset.org/) (WiX) is a toolset that builds Windows installation packages from XML source code. The toolset supports a command line environment that developers may integrate into their build processes to build MSI and MSM setup packages. This cookbook installs the full WiX suite of tools.

## Requirements

### Platforms

- Windows 7
- Windows Server 2008 R2
- Windows 8, 8.1
- Windows Server 2012 (R1, R2)

### Chef

- Chef 12.1+

### Cookbooks

- windows 2.0+

## Attributes

- `node['wix']['home']` - location to install WiX files to. default is `%SYSTEMDRIVE%\wix`
- `node['wix']['checksum']` - SHA256 of the WiX binaries zip file. default is `03b8f46cb3abf1465fe8f9975a94a4e0f75c77267ff4d1fcb6d5b6a97567f549`

## Usage

### default.rb

Downloads and installs WiX to the location specified by `node['wix']['home']`. Also ensures `node['wix']['home']` is in the system path.

## License & Authors

**Author:** Cookbook Engineering Team ([cookbooks@chef.io](mailto:cookbooks@chef.io))

**Copyright:** 2011-2018, Chef Software, Inc.

```text
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
