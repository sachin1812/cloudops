# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_19_110058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pricings", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "service_terms", force: :cascade do |t|
    t.string "sku"
    t.string "offerTermCode"
    t.string "effectiveDate"
    t.string "rateCode"
    t.string "description"
    t.string "beginRange"
    t.string "endRange"
    t.string "unit"
    t.string "pricePerUnit"
    t.string "currency_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "sku"
    t.string "productFamily"
    t.string "servicecode"
    t.string "location"
    t.string "locationType"
    t.string "fromLocation"
    t.string "fromLocationType"
    t.string "toLocation"
    t.string "toLocationType"
    t.string "usagetype"
    t.string "operation"
    t.string "requestDescription"
    t.string "requestType"
    t.string "servicename"
    t.string "publicationDate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sku"], name: "index_services_on_sku"
  end

end
