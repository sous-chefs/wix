require 'minitest/spec'

class WixInstallTest < MiniTest::Chef::TestCase

  def test_wix_installed
    result = system 'wmic product get Name|' \
      'findstr /r /c:"WiX[ ]Toolset[ ]v[0-9][0-9]*\.[0-9][0-9]*[ ]Core"'
    assert_equal(result, true, msg = 'Unable to find WiX Toolset installation.')
  end

end
