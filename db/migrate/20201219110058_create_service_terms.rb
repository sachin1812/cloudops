class CreateServiceTerms < ActiveRecord::Migration[6.0]
  def change
    create_table :service_terms do |t|
      t.string :sku
      t.string :offerTermCode
      t.string :effectiveDate
      t.string :rateCode
      t.string :description
      t.string :beginRange
      t.string :endRange
      t.string :unit
      t.string :pricePerUnit
      t.string :currency_code

      t.timestamps
    end
  end
end
