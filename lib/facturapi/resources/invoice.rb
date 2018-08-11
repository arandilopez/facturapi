module Facturapi
  class Invoice < Base
    require_relative 'invoice/catalogues'
    self.endpoint = 'invoices'

    def send_mail!
      return false if self.try(:id).nil?
      self.class.client.post(resource_url(self.id, "email"))
    end

    def download_zip!
      return false if self.try(:id).nil?
      self.class.client.get(resource_url(self.id, "zip"))
    end
  end
end
