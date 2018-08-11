module Facturapi
  class ApiKeyNotFoundError < StandardError
    def initialize(msg = "Add your api key in a intializer")
      super
    end
  end
end
