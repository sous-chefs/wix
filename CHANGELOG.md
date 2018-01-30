# wix Cookbook CHANGELOG
This file is used to list changes made in each version of the wix cookbook.

## 4.0.0 (2018-01-29)

- Removes codeplex functionality as it will no longer be updated.
- Changes wix toolkit

## 3.2.0 (2017-03-20)

- Test with Local Delivery instead of Rake
- Require Windows cookbook 2.0 or later

## 3.1.0 (2016-09-16)
- Require Chef 12.1 not 12.0

## 3.0.0 (2016-09-06)
- Add chef_version metadata
- Remove support for Chef 11

## v2.0.2 (2016-02-15)
- Require windows cookbook >= 1.38.2
- Update WiX to 3.10.2
- Avoid failures processing the cookie if the download wasn't successful in the Codeplex library
- Update the rubocop config for Rubocop 0.37
- Update all testing dependencies to the latest
- Add Windows 2008 R2 to the Test Kitchen config (internal Chef Vagrant image)

## v2.0.1
- Allow upgrades by setting `overwrite` attribute to true
- Add basic InSpec integration test coverage

## v2.0.0
- Update to use WIX Toolset 3.10
- Removed Windows 2003 as a supported platform and added all current 2008+ releases
- Update readme to point to the new post-Sourceforge WIX homepage
- Add Chefspec convergence tests on Windows 2008/2008R2/2012/2012R2
- Added Test Kitchen config using the Chef private Windows boxes due to licensing
- Added Chef standard Rubocop config and resolved all warnings
- Added Travis CI testing using Chef DK
- Added Berksfile
- Updated contributing and testing docs
- Added Gemfile with testing dependencies
- Added maintainers.toml and maintainers.md files
- Added Travis status and cookbook version badges to the readme
- Updated Opscode -> Chef Software
- Added a Rakefile for simplified testing
- Added a chefignore file to limit what files are uploaded to the Chef server
- Added issues_url and source_url metadata for Supermarket

## v1.1.0:
- [COOK-2762] - WiX download URL returns a 404

## v1.0.2:
- [COOK-1340] - update version and location

## v1.0.0:
- initial release
