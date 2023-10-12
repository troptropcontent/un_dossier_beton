# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_10_12_074153) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "fields", force: :cascade do |t|
    t.integer "kind"
    t.bigint "schema_id", null: false
    t.string "name"
    t.string "normalized_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schema_id"], name: "index_fields_on_schema_id"
  end

  create_table "folders", force: :cascade do |t|
    t.string "name"
    t.string "holder_type", null: false
    t.bigint "holder_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["holder_type", "holder_id"], name: "index_folders_on_holder"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.bigint "folder_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["folder_id"], name: "index_items_on_folder_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties_currencies", force: :cascade do |t|
    t.integer "value_cents", default: 0, null: false
    t.string "value_currency", default: "USD", null: false
    t.bigint "item_id", null: false
    t.bigint "field_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_id"], name: "index_properties_currencies_on_field_id"
    t.index ["item_id"], name: "index_properties_currencies_on_item_id"
  end

  create_table "properties_dates", force: :cascade do |t|
    t.date "value"
    t.bigint "item_id", null: false
    t.bigint "field_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_id"], name: "index_properties_dates_on_field_id"
    t.index ["item_id"], name: "index_properties_dates_on_item_id"
  end

  create_table "properties_documents", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "field_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_id"], name: "index_properties_documents_on_field_id"
    t.index ["item_id"], name: "index_properties_documents_on_item_id"
  end

  create_table "properties_folders", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "field_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_id"], name: "index_properties_folders_on_field_id"
    t.index ["item_id"], name: "index_properties_folders_on_item_id"
  end

  create_table "schemas", force: :cascade do |t|
    t.string "holder_type", null: false
    t.bigint "holder_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["holder_type", "holder_id"], name: "index_schemas_on_holder"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "fields", "schemas"
  add_foreign_key "items", "folders"
  add_foreign_key "properties_currencies", "fields"
  add_foreign_key "properties_currencies", "items"
  add_foreign_key "properties_dates", "fields"
  add_foreign_key "properties_dates", "items"
  add_foreign_key "properties_documents", "fields"
  add_foreign_key "properties_documents", "items"
  add_foreign_key "properties_folders", "fields"
  add_foreign_key "properties_folders", "items"
end
