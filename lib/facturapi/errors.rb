module Facturapi
  class ApiKeyNotFoundError < StandardError
    def initialize(msg = "Facturapi key is missing. Add your api key in a initializer")
      super
    end
  end
end
