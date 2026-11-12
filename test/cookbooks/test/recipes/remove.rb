# frozen_string_literal: true

wix_install 'install WiX'
wix_install 'remove WiX' do
  action :remove
end
