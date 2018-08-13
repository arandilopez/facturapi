require "test_helper"
require "support/mock_responses"

class CustomerTest < Minitest::Test
  include Facturapi::MockResponses

  def test_retreive_all_customers
    response = Minitest::Mock.new
    response.expect :body, customers_response
    mock_response_for :get, with: response do
      customers = Facturapi::Customer.all
      customers.each do |customer|
        assert_equal Facturapi::Customer, customer.class
        refute_nil customer.id
      end
    end
  end

  def test_retreive_customer_by_id
    response = Minitest::Mock.new
    response.expect :body, customer_response
    mock_response_for :get, with: response do
      customer = Facturapi::Customer.retrieve("590ce6c56d04f840aa8438af")
      assert_equal Facturapi::Customer, customer.class
      refute_nil customer.id
      assert_equal "590ce6c56d04f840aa8438af", customer.id
    end
  end

  def test_create_customer
    response = Minitest::Mock.new
    response.expect :body, customer_response
    mock_response_for :post, with: response do
      customer = Facturapi::Customer.create({
        legal_name: "John Doe",
        email: "email@example.com",
        tax_id: "ABCD111111ABC",
        address: {
          zip: "44940",
          street: "Sunset Blvd"
        }
      })
      assert_equal Facturapi::Customer, customer.class
      refute_nil customer.id
      assert_equal "590ce6c56d04f840aa8438af", customer.id
    end
  end

  def test_update_customer
    response = Minitest::Mock.new
    response.expect :body, customer_response
    id = "590ce6c56d04f840aa8438af"
    mock_response_for :put, with: response do
      customer = Facturapi::Customer.update(id, {
        email: "emai2l@example.com",
        address: {
          street: "Sunset Blvd"
        }
      })
      assert_equal Facturapi::Customer, customer.class
      refute_nil customer.id
      assert_equal "590ce6c56d04f840aa8438af", customer.id
    end
  end

  def test_update_customer_via_instance
    customer = Facturapi::Customer.new JSON.parse(customer_response)
    response = Minitest::Mock.new
    response.expect :body, customer_response
    mock_response_for :put, with: response do
      customer.update({
        email: "emai2l@example.com",
        address: {
          street: "Sunset Blvd"
        }
      })
      assert_equal Facturapi::Customer, customer.class
      refute_nil customer.id
      assert_equal "590ce6c56d04f840aa8438af", customer.id
    end
  end

  def test_delete_customer
    #code
  end

  def test_delete_customer_via_instance
    #code
  end
end
