module Facturapi
  module JSONResponses
    def mock_response(method, with:, &block)
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
