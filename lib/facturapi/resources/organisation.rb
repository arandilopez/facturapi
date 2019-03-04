module Facturapi
  class Organization < Base
    self.endpoint = 'organizations'

    def update_legal(payload = {})
      url = self.class.resource_url(self.id, 'legal')
      reponse = self.class.client.put(url, payload)
      self.class.new response
    end

    def update_certificate(payload = {})
      url = self.class.resource_url(self.id, 'certificate')
      payload = payload.merge({multipart: true})
      response = self.class.client.put(url, payload)
      self.class.new response
    end

    class << self
      def get_api_keys(id)
        client.get(resource_url(id, 'apikeys'))
      end
    end
  end
end
