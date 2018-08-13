require "test_helper"
require "support/mock_responses"

class InvoiceTest < Minitest::Test
  include Facturapi::MockResponses
  def test_retreive_all_invoices_as_instances
    response = Minitest::Mock.new
    response.expect :body, invoices_response
    mock_response_for :get, with: response do
      invoices = Facturapi::Invoice.all
      invoices.each do |invoice|
        assert_equal Facturapi::Invoice, invoice.class
      end
    end
  end

  def test_retreive_one_invoice_by_id
    response = Minitest::Mock.new
    response.expect :body, invoice_response
    mock_response_for :get, with: response do
      invoice = Facturapi::Invoice.retrieve("58e93bd8e86eb318b019743d")
      assert_equal Facturapi::Invoice, invoice.class
      assert_equal "58e93bd8e86eb318b019743d", invoice.id
    end
  end

  def test_create_invoice
    response = Minitest::Mock.new
    response.expect :body, invoice_response
    mock_response_for :post, with: response do
      invoice = Facturapi::Invoice.create({
        :customer => "97657645234567",
        :items => [
          {
            :quantity => 1,
            :product => "4523456789564356023"
          },
          {
            :quantity => 2,
            :product => {
              :description => "Guitarra",
              :product_key => "01234567",
              :price => 420.69,
              :sku => "ABC4567"
            }
          }
        ],
        :payment_form => Facturapi::Invoice::PaymentForm::EFECTIVO,
        :payment_method => Facturapi::Invoice::PaymentMethod::PARCIALIDADES,
        :folio_number => "581",
        :series => "F"
      })
      assert_equal Facturapi::Invoice, invoice.class
      assert_equal "58e93bd8e86eb318b019743d", invoice.id
    end
  end

  def test_create_credit_invoice
    response = Minitest::Mock.new
    response.expect :body, credit_invoice_response
    mock_response_for :post, with: response do
      invoice = Facturapi::Invoice.create({
        :type => Facturapi::Invoice::Type::EGRESO,
        :customer => "658747643563432",
        :payment_form => Facturapi::Invoice::PaymentForm::EFECTIVO,
        :relation => Facturapi::Invoice::Relation::DEVOLUCION,
        :related => "729972FF-E350-4D48-90AA-D8DF2B7CE2F2",
        :product => {
          :description => "Devolución de Impresora HP G3700",
          :price => 499.50
        }
      })
      assert_equal Facturapi::Invoice, invoice.class
      assert_equal "58e93bd8e86eb318b019743d", invoice.id
      assert_equal "E", invoice.type
    end
  end

  def test_create_payment_receipt_invoice
    response = Minitest::Mock.new
    response.expect :body, payment_receipt_invoice_response
    mock_response_for :post, with: response do
      invoice = Facturapi::Invoice.create({
        :type => Facturapi::Invoice::Type::PAGO,
        :customer => "658747643563432",
        :payments => [
          {
            :payment_form => Facturapi::Invoice::PaymentForm::EFECTIVO,
            :related => {
              :uuid => "729972FF-E350-4D48-90AA-D8DF2B7CE2F2",
              :installment => 1,
              :last_balance => 1000,
              :amount => 100
            },
          }
        ]
      })
      assert_equal Facturapi::Invoice, invoice.class
      assert_equal "58e93bd8e86eb318b019743d", invoice.id
      assert_equal "P", invoice.type
    end
  end

  def test_cancel_invoice
    assert Facturapi::Invoice.respond_to?(:cancel)
    response = Minitest::Mock.new
    response.expect :body, canceled_invoice_response
    mock_response_for :delete, with: response do
      invoice = Facturapi::Invoice.cancel("58e93bd8e86eb318b019743d")
      assert_equal Facturapi::Invoice, invoice.class
      assert_equal "58e93bd8e86eb318b019743d", invoice.id
      assert_equal "canceled", invoice.status
    end
  end

  def test_cancel_invoice_via_instance
    invoice = Facturapi::Invoice.new(JSON.parse(invoice_response))
    assert invoice.respond_to?(:cancel!)
    response = Minitest::Mock.new
    response.expect :body, canceled_invoice_response
    mock_response_for :delete, with: response do
      invoice = invoice.cancel!
      assert_equal "canceled", invoice.status
    end
  end
end
