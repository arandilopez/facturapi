$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "facturapi"

require "minitest/autorun"

Facturapi.configure do |config|
  config.api_key = 'sk_test_r2QW0xXyOwNgnwqEPB3nKk8EJV6Yq43B'
end
