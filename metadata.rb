name 'wix'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache 2.0'
description 'Installs/Configures Windows Installer XML toolset (WiX)'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '2.0.0'
supports 'windows'

depends 'windows', '>= 1.2.2'

source_url 'https://github.com/chef-cookbooks/wix' if respond_to?(:source_url)
issues_url 'https://github.com/chef-cookbooks/wix/issues' if respond_to?(:issues_url)
