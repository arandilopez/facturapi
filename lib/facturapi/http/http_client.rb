require "base64"
require "json"
require "rest-client"

module Facturapi
  class HttpClient
    attr_reader :response
    def initialize
      @headers = {
        Authorization: authorization_value
      }
      @response = nil
    end

    def get(url, payload = {})
      @response = RestClient.get(url, headers(params: payload)) rescue nil
      parsed_body(@response.body)
    end

    def post(url, payload = {})
      @response = RestClient.post(url, payload, headers) rescue nil
      parsed_body(@response.body)

    end

    def put(url, payload ={})
      @response = RestClient.put(url, payload, headers) rescue nil
      parsed_body(@response.body)

    end

    def delete(url)
      @response = RestClient.delete(url) rescue nil
      parsed_body(@response.body)
    end

    private

    def headers(opts = {})
      @headers.merge(opts)
    end

    def authorization_value
      raise ApiKeyNotFoundError if Facturapi.configuration.api_key.nil?
      "Basic " + Base64.encode64(Facturapi.configuration.api_key + ":")
    end

    def parsed_body(body)
      JSON.parse body
    end
  end
end
