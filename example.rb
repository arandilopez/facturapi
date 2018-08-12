require "bundler/setup"
require "facturapi"

Facturapi.configuration.api_key = "sk_test_r2QW0xXyOwNgnwqEPB3nKk8EJV6Yq43B"

customer = Facturapi::Customer.all.first
product = Facturapi::Product.all.first

invoice = Facturapi::Invoice.create({
  :customer => customer.id,
  :items => [
    {
      :quantity => 2,
      :product => product.id
    }
  ],
  :payment_form => Facturapi::Invoice::PaymentForm::EFECTIVO,
  :folio_number => "581",
  :series => "F"
})

p invoice
