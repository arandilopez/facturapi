module Facturapi
  module MockResponses
    def mock_response_for(method = :get, with: {}, &block)
      RestClient.stub(method, with, &block)
    end

    def invoices_response
      File.read "test/support/examples/invoices.json"
    end

    def invoice_response
      File.read "test/support/examples/invoice.json"
    end
  end
end
