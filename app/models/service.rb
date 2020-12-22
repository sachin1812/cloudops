class Service < ApplicationRecord
  include Serviceable
  self.primary_key = 'sku'
  validates_uniqueness_of :sku
  has_many :service_terms, :class_name => "ServiceTerm", :foreign_key => "sku"

  def self.pricing_data
    Serviceable.store_service
    Serviceable.store_service_terms
  end

  def self.pricing(date,servicecode,location)
    region = location.titleize.upcase
    service = Service.where(servicecode: servicecode).where("upper(location) LIKE ?", "#{region}%")
    skus = service.map {|s| s[:sku]}
      if date.present?
        ServiceTerm.select("id","description","beginRange","endRange","unit","pricePerUnit","effectiveDate").where(effectiveDate: date).where("sku IN (?)", skus)
      else
        ServiceTerm.select("id","description","beginRange","endRange","unit","pricePerUnit","effectiveDate").where("sku IN (?)", skus)
      end
  end
end
