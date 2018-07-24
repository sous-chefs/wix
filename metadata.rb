name 'wix'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache-2.0'
description 'Installs/Configures Windows Installer XML toolset (WiX)'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '5.0.0'
supports 'windows'

depends 'windows', '>= 2.0'

source_url 'https://github.com/chef-cookbooks/wix'
issues_url 'https://github.com/chef-cookbooks/wix/issues'
chef_version '>= 13.4' if respond_to?(:chef_version)
