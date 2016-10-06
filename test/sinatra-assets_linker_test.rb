require "test_helper"
require "sinatra-assets_linker"

class SinatraAssetsLinkerTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::SinatraAssetsLinker::VERSION
  end
end
