module Facturapi
  class Configuration
    attr_accessor :api_key, :api_version
    attr_reader :api_url
    def initialize
      @api_key = nil
      @api_url = "https://www.facturapi.io/"
      @api_version = "v1"
    end
  end

  def self.configure
    yield configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end
end
