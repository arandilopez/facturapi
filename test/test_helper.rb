$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "facturapi"
require "minitest/mock"
require "minitest/autorun"

class Minitest::Test
  def setup
    Facturapi.configuration.api_key = 'sk_test_r2QW0xXyOwNgnwqEPB3nKk8EJV6Yq43B'
  end
end
