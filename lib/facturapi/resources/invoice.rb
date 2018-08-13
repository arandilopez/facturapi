require_relative 'invoice/catalogues'

module Facturapi
  class Invoice < Base
    self.endpoint = 'invoices'

    def send_by_email!
      return false if self.id.nil?
      url = self.class.resource_url(self.id, "email")
      self.class.client.post(url)
    end

    def download_zip!
      return false if self.id.nil?
      url = self.class.resource_url(self.id, "zip")
      self.class.client.get(url, {}, {accept: :zip})
    end

    def download_xml!
      return false if self.id.nil?
      url = self.class.resource_url(self.id, "xml")
      self.class.client.get(url, {}, {accept: :xml})
    end

    def download_pdf!
      return false if self.id.nil?
      url = self.class.resource_url(self.id, "pdf")
      self.class.client.get(url, {}, {accept: :pdf})
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
