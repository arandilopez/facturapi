require "test_helper"
require "support/mock_responses"

class HttpClientTest < Minitest::Test
  include Facturapi::MockResponses

  def test_it_raise_api_not_found_error
    Facturapi.configuration.api_key = nil
    assert_raises Facturapi::ApiKeyNotFoundError do
      Facturapi::HttpClient.new
    end
  end

  def test_return_a_valid_response
    client = Facturapi::HttpClient.new
    response = Minitest::Mock.new
    response.expect :body, invoices_response
    mock_response_for :get, with: response do
      result = client.get("https://www.facturapi.io/v1/invoices")
      refute_nil result['data']
    end
  end
end
