require "bundler/setup"
# Load the gem
require "facturapi"

# Setup your api key
# Facturapi.configuration.api_key = "sk_test_API_KEY"
Facturapi.configuration.api_key = "sk_test_r2QW0xXyOwNgnwqEPB3nKk8EJV6Yq43B"

# Create a new customer
customer = Facturapi::Customer.create({
  legal_name: "Juan Perez Perez",
  tax_id: "XAXX010101000",
  email: "juanperez@example.com",
  address: {
    zip: "05000",
    street: "Av. Gansitos"
  }
})

# Create a new product
product = Facturapi::Product.create({
  description: "Guitarra",
  product_key: "60131303", # Check for this catalogue
  sku: "TVP090909",
  price: 1500.00
})

# Create the invoice
invoice = Facturapi::Invoice.create({
  customer: customer.id, # use the customer id
  items: [
    {
      quantity: 2,
      product: product.id # use the product id
    }
  ],
  use: "G03",
  payment_form: Facturapi::Invoice::PaymentForm::TARJETA_DE_CREDITO, # add a payment form
  payment_method: Facturapi::Invoice::PaymentMethod::UNA_EXHIBICION,
  folio_number: "300",
  series: "F"
})

# Send the invoice by email
invoice.send_by_email!

# Or download it
Dir.mkdir "tmp" unless File.exist? "tmp"
File.open("tmp/#{invoice.id}.zip", "w") do |f|
  f.write invoice.download_zip!
end
