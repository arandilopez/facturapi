require "test_helper"

class URIBuilderTest < Minitest::Test
  def setup
    @endpoint = 'invoices'
  end

  def test_generate_url_with_api_base_url
    url = Facturapi::URIBuilder.build(@endpoint)
    assert_equal "https://www.facturapi.io/v1/invoices", url
  end

  def test_generate_url_with_api_base_url_with_id
    id = "7g6f76f5512653t756r"
    url = Facturapi::URIBuilder.build(@endpoint, id)
    assert_equal "https://www.facturapi.io/v1/invoices/7g6f76f5512653t756r", url
  end

  def test_generate_url_with_api_base_url_with_id_and_action
    id = "7g6f76f5512653t756r"
    url = Facturapi::URIBuilder.build(@endpoint, id, 'zip')
    assert_equal "https://www.facturapi.io/v1/invoices/7g6f76f5512653t756r/zip", url
  end
end
