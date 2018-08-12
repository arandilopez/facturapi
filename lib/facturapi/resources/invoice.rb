require_relative 'invoice/catalogues'

module Facturapi
  class Invoice < Base
    self.endpoint = 'invoices'

    def send_by_email!
      return false if self.id.nil?
      self.class.client.post(resource_url(self.id, "email"))
    end

    def download_zip!
      return false if self.id.nil?
      self.class.client.get(resource_url(self.id, "zip"))
    end

    def download_xml!
      return false if self.id.nil?
      self.class.client.get(resource_url(self.id, "xml"))
    end

    def download_pdf!
      return false if self.id.nil?
      self.class.client.get(resource_url(self.id, "pdf"))
    end

    def cancel!
      return false if self.id.nil?
      self.class.cancel(self.id)
    end

    class << self
      alias_method :cancel, :delete
    end
  end
end
