require "ostruct"

module Facturapi
  class Base < OpenStruct
    def update(attributes = {})
      return false if self.id.nil?
      self.class.update(self.id, attributes)
    end

    def delete!
      return false if self.id.nil?
      self.class.delete(self.id)
    end

    class << self
      attr_accessor :endpoint

      def all(params = {})
        response = client.get(resource_url, params)
        response['data'].map { |e| self.new e }
      end

      def retrieve(id)
        response = client.get(resource_url(id))
        self.new response
      end

      def create(payload = {})
        response = client.post(resource_url, payload)
        self.new response
      end

      def update(id, payload = {})
        response = client.put(resource_url(id), payload)
        self.new response
      end

      def delete(id)
        response = client.delete(resource_url(id))
        self.new response
      end

      def client
        @client ||= HttpClient.new
      end

      def resource_url(*extras)
        URIBuilder.build(endpoint, *extras)
      end
    end
  end
end
