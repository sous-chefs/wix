require 'minitest/spec'

class WixInstallTest < MiniTest::Chef::TestCase

  def test_wix_installed
    result = system 'wmic product get Name|findstr /c:"WiX Toolset v3.6 Core"'
    assert_equal(true, result, msg = 'WiX Toolset v3.6 Core')
  end

end
