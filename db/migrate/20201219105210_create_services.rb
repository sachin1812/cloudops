class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :sku
      t.string :productFamily
      t.string :servicecode
      t.string :location
      t.string :locationType
      t.string :fromLocation
      t.string :fromLocationType
      t.string :toLocation
      t.string :toLocationType
      t.string :usagetype
      t.string :operation
      t.string :requestDescription
      t.string :requestType
      t.string :servicename
      t.string :publicationDate

      t.timestamps
    end
    add_index :services, :sku
  end
end
