require "base64"
require "json"
require "rest-client"

module Facturapi
  class HttpClient
    attr_reader :response
    def initialize
      @headers = {
        Authorization: authorization_value,
        accept: :json,
        content_type: :json
      }
      @response = nil
    end

    def get(url, payload = {}, headers = {})
      headers[:params] = payload
      @response = RestClient.get(url, headers(headers)) rescue nil
      parsed_body(@response.body)
    end

    def post(url, payload = {})
      @response = RestClient.post(url, payload.to_json, headers) rescue nil
      parsed_body(@response.body)
    end

    def put(url, payload ={})
      @response = RestClient.put(url, payload.to_json, headers) rescue nil
      parsed_body(@response.body)

    end

    def delete(url)
      @response = RestClient.delete(url, headers) rescue nil
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
      JSON.parse body rescue body
    end
  end
end
