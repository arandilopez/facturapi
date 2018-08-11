require "addressable/template"

module Facturapi
  module URIBuilder
    def self.build(*params)
      template = Addressable::Template.new("#{Facturapi.configuration.api_url}{/version}{/segments*}")
      template.expand({
        version: Facturapi.configuration.api_version,
        segments: params
      }).to_s
    end
  end
end
