require "test_helper"

class FacturapiTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil Facturapi::VERSION
  end

  def test_that_it_can_config
    assert Facturapi.respond_to?(:configure)
  end
end
