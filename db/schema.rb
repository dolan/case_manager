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

ActiveRecord::Schema[8.0].define(version: 2024_11_29_123742) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "asset_identities", force: :cascade do |t|
    t.uuid "uuid"
    t.string "make"
    t.string "model"
    t.integer "year"
    t.string "serial_number"
    t.string "vin"
    t.string "chassis_id"
    t.string "unit_number"
    t.bigint "created_by_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_user_id"], name: "index_asset_identities_on_created_by_user_id"
    t.index ["uuid"], name: "index_asset_identities_on_uuid"
  end

  create_table "assets", force: :cascade do |t|
    t.uuid "uuid"
    t.bigint "asset_identity_id"
    t.bigint "business_location_id"
    t.bigint "created_by_user_id"
    t.bigint "updated_by_user_id"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_identity_id"], name: "index_assets_on_asset_identity_id"
    t.index ["business_location_id"], name: "index_assets_on_business_location_id"
    t.index ["created_by_user_id"], name: "index_assets_on_created_by_user_id"
    t.index ["updated_by_user_id"], name: "index_assets_on_updated_by_user_id"
    t.index ["uuid"], name: "index_assets_on_uuid"
  end

  create_table "buisnesses", force: :cascade do |t|
    t.uuid "uuid"
    t.string "category"
    t.string "name"
    t.string "description"
    t.bigint "primary_location_id"
    t.string "brand_identifier"
    t.json "metadata"
    t.bigint "created_by_user_id"
    t.bigint "updated_by_user_id"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category"], name: "index_buisnesses_on_category"
    t.index ["created_by_user_id"], name: "index_buisnesses_on_created_by_user_id"
    t.index ["name"], name: "index_buisnesses_on_name"
    t.index ["updated_by_user_id"], name: "index_buisnesses_on_updated_by_user_id"
    t.index ["uuid"], name: "index_buisnesses_on_uuid"
  end

  create_table "business_locations", force: :cascade do |t|
    t.uuid "uuid"
    t.bigint "business_id"
    t.bigint "location_id"
    t.bigint "created_by_user_id"
    t.json "metadata"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["business_id"], name: "index_business_locations_on_business_id"
    t.index ["created_by_user_id"], name: "index_business_locations_on_created_by_user_id"
    t.index ["location_id"], name: "index_business_locations_on_location_id"
    t.index ["name"], name: "index_business_locations_on_name"
    t.index ["uuid"], name: "index_business_locations_on_uuid"
  end

  create_table "case_activities", force: :cascade do |t|
    t.uuid "uuid"
    t.bigint "case_id"
    t.string "title"
    t.string "description"
    t.string "category"
    t.datetime "occurred_at"
    t.bigint "actor_user_id"
    t.bigint "target_user_id"
    t.string "audience_category"
    t.json "metadata"
    t.bigint "created_by_user_id"
    t.bigint "updated_by_user_id"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actor_user_id"], name: "index_case_activities_on_actor_user_id"
    t.index ["case_id"], name: "index_case_activities_on_case_id"
    t.index ["category"], name: "index_case_activities_on_category"
    t.index ["created_by_user_id"], name: "index_case_activities_on_created_by_user_id"
    t.index ["occurred_at"], name: "index_case_activities_on_occurred_at"
    t.index ["target_user_id"], name: "index_case_activities_on_target_user_id"
    t.index ["updated_by_user_id"], name: "index_case_activities_on_updated_by_user_id"
    t.index ["uuid"], name: "index_case_activities_on_uuid"
  end

  create_table "case_items", force: :cascade do |t|
    t.uuid "uuid"
    t.bigint "case_id"
    t.integer "item_order"
    t.string "title"
    t.string "description"
    t.json "metadata"
    t.string "code"
    t.string "source"
    t.string "category"
    t.decimal "quantity", precision: 19, scale: 4
    t.string "unit_of_measure"
    t.decimal "unit_price", precision: 19, scale: 4
    t.bigint "created_by_user_id"
    t.bigint "updated_by_user_id"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["case_id"], name: "index_case_items_on_case_id"
    t.index ["created_by_user_id"], name: "index_case_items_on_created_by_user_id"
    t.index ["updated_by_user_id"], name: "index_case_items_on_updated_by_user_id"
    t.index ["uuid"], name: "index_case_items_on_uuid"
  end

  create_table "case_totals", force: :cascade do |t|
    t.uuid "uuid"
    t.bigint "case_id"
    t.decimal "total_price", precision: 19, scale: 4
    t.decimal "tax_total", precision: 19, scale: 4
    t.decimal "labor_total", precision: 19, scale: 4
    t.decimal "materials_total", precision: 19, scale: 4
    t.json "metadata"
    t.bigint "created_by_user_id"
    t.bigint "updated_by_user_id"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["case_id"], name: "index_case_totals_on_case_id"
    t.index ["created_by_user_id"], name: "index_case_totals_on_created_by_user_id"
    t.index ["updated_by_user_id"], name: "index_case_totals_on_updated_by_user_id"
    t.index ["uuid"], name: "index_case_totals_on_uuid"
  end

  create_table "cases", force: :cascade do |t|
    t.uuid "uuid"
    t.string "reference_number"
    t.string "complaint"
    t.bigint "asset_id"
    t.bigint "service_provider_business_location_id"
    t.bigint "ship_to_customer_id"
    t.bigint "bill_to_customer_id"
    t.bigint "assigned_to_user_id"
    t.string "source"
    t.bigint "created_by_user_id"
    t.bigint "updated_by_user_id"
    t.datetime "estimated_complete_at"
    t.datetime "actual_completed_at"
    t.datetime "next_follow_up_at"
    t.datetime "checked_in_at"
    t.datetime "discarded_at"
    t.json "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_cases_on_asset_id"
    t.index ["assigned_to_user_id"], name: "index_cases_on_assigned_to_user_id"
    t.index ["bill_to_customer_id"], name: "index_cases_on_bill_to_customer_id"
    t.index ["created_by_user_id"], name: "index_cases_on_created_by_user_id"
    t.index ["next_follow_up_at"], name: "index_cases_on_next_follow_up_at"
    t.index ["reference_number"], name: "index_cases_on_reference_number"
    t.index ["service_provider_business_location_id"], name: "index_cases_on_service_provider_business_location_id"
    t.index ["ship_to_customer_id"], name: "index_cases_on_ship_to_customer_id"
    t.index ["source"], name: "index_cases_on_source"
    t.index ["updated_by_user_id"], name: "index_cases_on_updated_by_user_id"
    t.index ["uuid"], name: "index_cases_on_uuid"
  end

  create_table "customers", force: :cascade do |t|
    t.uuid "uuid"
    t.bigint "business_location_id"
    t.string "display_name"
    t.string "description"
    t.json "metadata"
    t.bigint "created_by_user_id"
    t.bigint "updated_by_user_id"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_location_id"], name: "index_customers_on_business_location_id"
    t.index ["created_by_user_id"], name: "index_customers_on_created_by_user_id"
    t.index ["display_name"], name: "index_customers_on_display_name"
    t.index ["updated_by_user_id"], name: "index_customers_on_updated_by_user_id"
    t.index ["uuid"], name: "index_customers_on_uuid"
  end

  create_table "group_role_assignments", force: :cascade do |t|
    t.uuid "uuid"
    t.bigint "group_id"
    t.bigint "security_role_id"
    t.bigint "created_by_user_id"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_user_id"], name: "index_group_role_assignments_on_created_by_user_id"
    t.index ["group_id"], name: "index_group_role_assignments_on_group_id"
    t.index ["security_role_id"], name: "index_group_role_assignments_on_security_role_id"
    t.index ["uuid"], name: "index_group_role_assignments_on_uuid"
  end

  create_table "groups", force: :cascade do |t|
    t.uuid "uuid"
    t.string "name"
    t.string "category"
    t.bigint "created_by_user_id"
    t.bigint "updated_by_user_id"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category"], name: "index_groups_on_category"
    t.index ["created_by_user_id"], name: "index_groups_on_created_by_user_id"
    t.index ["name"], name: "index_groups_on_name"
    t.index ["updated_by_user_id"], name: "index_groups_on_updated_by_user_id"
    t.index ["uuid"], name: "index_groups_on_uuid"
  end

  create_table "locations", force: :cascade do |t|
    t.uuid "uuid"
    t.string "name"
    t.string "description"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "address_line_3"
    t.string "city"
    t.string "geographical_region"
    t.string "country_iso_code"
    t.string "timezone"
    t.string "culture"
    t.json "metadata"
    t.bigint "created_by_user_id"
    t.string "updated_by_user_id"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_user_id"], name: "index_locations_on_created_by_user_id"
    t.index ["name"], name: "index_locations_on_name"
    t.index ["updated_by_user_id"], name: "index_locations_on_updated_by_user_id"
    t.index ["uuid"], name: "index_locations_on_uuid"
  end

  create_table "security_permissions", force: :cascade do |t|
    t.uuid "uuid"
    t.string "name"
    t.bigint "created_by_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_user_id"], name: "index_security_permissions_on_created_by_user_id"
    t.index ["name"], name: "index_security_permissions_on_name"
    t.index ["uuid"], name: "index_security_permissions_on_uuid"
  end

  create_table "security_role_permissions", force: :cascade do |t|
    t.uuid "uuid"
    t.bigint "security_role_id"
    t.bigint "security_permission_id"
    t.bigint "created_by_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_user_id"], name: "index_security_role_permissions_on_created_by_user_id"
    t.index ["security_permission_id"], name: "index_security_role_permissions_on_security_permission_id"
    t.index ["security_role_id"], name: "index_security_role_permissions_on_security_role_id"
    t.index ["uuid"], name: "index_security_role_permissions_on_uuid"
  end

  create_table "security_roles", force: :cascade do |t|
    t.uuid "uuid"
    t.string "name"
    t.string "category"
    t.bigint "created_by_user_id"
    t.bigint "updated_by_user_id"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category"], name: "index_security_roles_on_category"
    t.index ["created_by_user_id"], name: "index_security_roles_on_created_by_user_id"
    t.index ["name"], name: "index_security_roles_on_name"
    t.index ["updated_by_user_id"], name: "index_security_roles_on_updated_by_user_id"
    t.index ["uuid"], name: "index_security_roles_on_uuid"
  end

  create_table "user_group_memberships", force: :cascade do |t|
    t.uuid "uuid"
    t.bigint "user_id"
    t.bigint "group_id"
    t.bigint "created_by_user_id"
    t.bigint "updated_by_user_id"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_user_id"], name: "index_user_group_memberships_on_created_by_user_id"
    t.index ["group_id"], name: "index_user_group_memberships_on_group_id"
    t.index ["user_id"], name: "index_user_group_memberships_on_user_id"
    t.index ["uuid"], name: "index_user_group_memberships_on_uuid"
  end

  create_table "user_role_assignments", force: :cascade do |t|
    t.uuid "uuid"
    t.bigint "user_id"
    t.bigint "security_role_id"
    t.bigint "created_by_user_id"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_user_id"], name: "index_user_role_assignments_on_created_by_user_id"
    t.index ["security_role_id"], name: "index_user_role_assignments_on_security_role_id"
    t.index ["user_id"], name: "index_user_role_assignments_on_user_id"
    t.index ["uuid"], name: "index_user_role_assignments_on_uuid"
  end

  create_table "users", force: :cascade do |t|
    t.uuid "uuid"
    t.string "email"
    t.string "encrypted_password"
    t.string "reset_password_token"
    t.datetime "reset_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.bigint "created_by_user_id"
    t.bigint "updated_by_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_user_id"], name: "index_users_on_created_by_user_id"
    t.index ["email"], name: "index_users_on_email"
    t.index ["updated_by_user_id"], name: "index_users_on_updated_by_user_id"
    t.index ["uuid"], name: "index_users_on_uuid"
  end
end
