module Facturapi
  module JSONResponses
    def invoices_response
      %{{
  "page": 1,
  "total_pages": 1,
  "data": [
    {
      "id": "58e93bd8e86eb318b019743d",
      "created_at": "2017-03-26T01:49:47.372Z",
      "livemode": false,
      "status": "active",
      "customer": {
        "id": "58e93bd8e86eb318b0197456",
        "legal_name": "Bimbo de México S.A. de C.V.",
        "tax_id": "MESB900314R87"
      },
      "total": 345.6,
      "uuid": "45BEC0CA-5F1E-491E-9417-698EA48C382A",
      "items": [
        {
          "quantity": 2,
          "discount": 0,
          "product": {
            "id": "58e93bd8e86eb318b0197454",
            "description": "Guitarra"
          }
        }
      ]
    }
  ]
  }}
    end
  end
end
