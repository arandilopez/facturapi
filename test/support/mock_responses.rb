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

    def credit_invoice_response
      File.read "test/support/examples/credit_invoice.json"
    end

    def payment_receipt_invoice_response
      File.read "test/support/examples/payment_receipt_invoice.json"
    end

    def canceled_invoice_response
      File.read "test/support/examples/canceled_invoice.json"
    end
  end
end
