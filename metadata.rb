name 'wix'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache 2.0'
description 'Installs/Configures Windows Installer XML toolset (WiX)'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '3.1.0'
supports 'windows'

depends 'windows', '>= 1.38.2'

source_url 'https://github.com/chef-cookbooks/wix'
issues_url 'https://github.com/chef-cookbooks/wix/issues'
chef_version '>= 12.1' if respond_to?(:chef_version)
