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

ActiveRecord::Schema[7.0].define(version: 2022_06_18_224020) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "action_mailbox_inbound_emails", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.string "message_id", null: false
    t.string "message_checksum", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id", "message_checksum"], name: "index_action_mailbox_inbound_emails_uniqueness", unique: true
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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

  create_table "addresses", force: :cascade do |t|
    t.uuid "uuid_token", default: -> { "gen_random_uuid()" }, null: false
    t.uuid "uuid_secure", default: -> { "gen_random_uuid()" }, null: false
    t.string "formatted_address", default: "", null: false
    t.string "house_number", default: "", null: false
    t.string "street_number", default: "", null: false
    t.string "street_name", default: "", null: false
    t.string "street", default: "", null: false
    t.string "city", default: "", null: false
    t.string "zip_code", default: "", null: false
    t.string "department", default: "", null: false
    t.string "department_code", default: "", null: false
    t.string "state", default: "", null: false
    t.string "state_code", default: "", null: false
    t.string "country", default: "", null: false
    t.string "country_code", default: "", null: false
    t.float "lat", default: 0.0, null: false
    t.float "lng", default: 0.0, null: false
    t.boolean "primary", default: false, null: false
    t.boolean "active", default: true, null: false
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "draft", null: false
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable"
    t.index ["discarded_at"], name: "index_addresses_on_discarded_at"
    t.index ["uuid_secure"], name: "index_addresses_on_uuid_secure", unique: true
    t.index ["uuid_token"], name: "index_addresses_on_uuid_token", unique: true
  end

  create_table "ahoy_events", force: :cascade do |t|
    t.bigint "visit_id"
    t.bigint "user_id"
    t.string "name"
    t.jsonb "properties"
    t.datetime "time"
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_ahoy_events_on_discarded_at"
    t.index ["name", "time"], name: "index_ahoy_events_on_name_and_time"
    t.index ["properties"], name: "index_ahoy_events_on_properties", opclass: :jsonb_path_ops, using: :gin
    t.index ["user_id"], name: "index_ahoy_events_on_user_id"
    t.index ["visit_id"], name: "index_ahoy_events_on_visit_id"
  end

  create_table "ahoy_visits", force: :cascade do |t|
    t.string "visit_token"
    t.string "visitor_token"
    t.bigint "user_id"
    t.string "ip"
    t.text "user_agent"
    t.text "referrer"
    t.string "referring_domain"
    t.text "landing_page"
    t.string "browser"
    t.string "os"
    t.string "device_type"
    t.string "country"
    t.string "region"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_term"
    t.string "utm_content"
    t.string "utm_campaign"
    t.string "app_version"
    t.string "os_version"
    t.string "platform"
    t.datetime "started_at"
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_ahoy_visits_on_discarded_at"
    t.index ["user_id"], name: "index_ahoy_visits_on_user_id"
    t.index ["visit_token"], name: "index_ahoy_visits_on_visit_token", unique: true
  end

  create_table "facebook_accounts", force: :cascade do |t|
    t.uuid "uuid_token", default: -> { "gen_random_uuid()" }, null: false
    t.uuid "uuid_secure", default: -> { "gen_random_uuid()" }, null: false
    t.bigint "user_id", null: false
    t.string "uid"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_facebook_accounts_on_discarded_at"
    t.index ["user_id"], name: "index_facebook_accounts_on_user_id"
    t.index ["uuid_secure"], name: "index_facebook_accounts_on_uuid_secure", unique: true
    t.index ["uuid_token"], name: "index_facebook_accounts_on_uuid_token", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "github_accounts", force: :cascade do |t|
    t.uuid "uuid_token", default: -> { "gen_random_uuid()" }, null: false
    t.uuid "uuid_secure", default: -> { "gen_random_uuid()" }, null: false
    t.string "uid"
    t.bigint "user_id", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_github_accounts_on_discarded_at"
    t.index ["user_id"], name: "index_github_accounts_on_user_id"
    t.index ["uuid_secure"], name: "index_github_accounts_on_uuid_secure", unique: true
    t.index ["uuid_token"], name: "index_github_accounts_on_uuid_token", unique: true
  end

  create_table "google_accounts", force: :cascade do |t|
    t.uuid "uuid_token", default: -> { "gen_random_uuid()" }, null: false
    t.uuid "uuid_secure", default: -> { "gen_random_uuid()" }, null: false
    t.bigint "user_id", null: false
    t.string "uid"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_google_accounts_on_discarded_at"
    t.index ["user_id"], name: "index_google_accounts_on_user_id"
    t.index ["uuid_secure"], name: "index_google_accounts_on_uuid_secure", unique: true
    t.index ["uuid_token"], name: "index_google_accounts_on_uuid_token", unique: true
  end

  create_table "linkedin_accounts", force: :cascade do |t|
    t.uuid "uuid_token", default: -> { "gen_random_uuid()" }, null: false
    t.uuid "uuid_secure", default: -> { "gen_random_uuid()" }, null: false
    t.bigint "user_id", null: false
    t.string "uid"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_linkedin_accounts_on_discarded_at"
    t.index ["user_id"], name: "index_linkedin_accounts_on_user_id"
    t.index ["uuid_secure"], name: "index_linkedin_accounts_on_uuid_secure", unique: true
    t.index ["uuid_token"], name: "index_linkedin_accounts_on_uuid_token", unique: true
  end

  create_table "old_passwords", force: :cascade do |t|
    t.string "encrypted_password", null: false
    t.string "password_archivable_type", null: false
    t.integer "password_archivable_id", null: false
    t.datetime "created_at"
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_old_passwords_on_discarded_at"
    t.index ["password_archivable_type", "password_archivable_id"], name: "index_password_archivable"
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.uuid "uuid_token", default: -> { "gen_random_uuid()" }, null: false
    t.uuid "uuid_secure", default: -> { "gen_random_uuid()" }, null: false
    t.string "number", default: "", null: false
    t.string "country_code", default: "", null: false
    t.string "national_dialing_prefix", default: "", null: false
    t.string "char_3_code", default: "", null: false
    t.string "name", default: "", null: false
    t.string "international_dialing_prefix", default: "", null: false
    t.string "area_code", default: "", null: false
    t.string "extension", default: "", null: false
    t.string "full_international", default: "", null: false
    t.boolean "primary", default: false, null: false
    t.boolean "verified", default: false, null: false
    t.boolean "active", default: true, null: false
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "draft", null: false
    t.string "phoneable_type"
    t.bigint "phoneable_id"
    t.index ["discarded_at"], name: "index_phone_numbers_on_discarded_at"
    t.index ["phoneable_type", "phoneable_id"], name: "index_phone_numbers_on_phoneable"
    t.index ["uuid_secure"], name: "index_phone_numbers_on_uuid_secure", unique: true
    t.index ["uuid_token"], name: "index_phone_numbers_on_uuid_token", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.integer "status", default: 0, null: false
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_roles_on_discarded_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
    t.index ["slug"], name: "index_roles_on_slug", unique: true
  end

  create_table "rollups", force: :cascade do |t|
    t.string "name", null: false
    t.string "interval", null: false
    t.datetime "time", null: false
    t.jsonb "dimensions", default: {}, null: false
    t.float "value"
    t.index ["name", "interval", "time", "dimensions"], name: "index_rollups_on_name_and_interval_and_time_and_dimensions", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.uuid "uuid_token", default: -> { "gen_random_uuid()" }, null: false
    t.uuid "uuid_secure", default: -> { "gen_random_uuid()" }, null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "username", default: "", null: false
    t.integer "gender", default: 0, null: false
    t.integer "honorific", default: 0, null: false
    t.integer "pronoun", default: 0, null: false
    t.date "date_of_birth"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.boolean "suspended", default: false, null: false
    t.string "suspend_reason", default: "", null: false
    t.datetime "password_changed_at"
    t.string "unique_session_id"
    t.datetime "last_activity_at"
    t.datetime "expired_at"
    t.string "paranoid_verification_code"
    t.integer "paranoid_verification_attempt", default: 0
    t.datetime "paranoid_verified_at"
    t.integer "second_factor_attempts_count", default: 0
    t.string "encrypted_otp_secret_key"
    t.string "encrypted_otp_secret_key_iv"
    t.string "encrypted_otp_secret_key_salt"
    t.string "direct_otp"
    t.datetime "direct_otp_sent_at", precision: nil
    t.datetime "totp_timestamp", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.integer "verification", default: 0, null: false
    t.string "time_zone", default: "UTC", null: false
    t.string "slug"
    t.string "locale_code", default: "en", null: false
    t.integer "status", default: 0, null: false
    t.integer "online_status", default: 0, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["discarded_at"], name: "index_users_on_discarded_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["encrypted_otp_secret_key"], name: "index_users_on_encrypted_otp_secret_key", unique: true
    t.index ["expired_at"], name: "index_users_on_expired_at"
    t.index ["last_activity_at"], name: "index_users_on_last_activity_at"
    t.index ["paranoid_verification_code"], name: "index_users_on_paranoid_verification_code"
    t.index ["paranoid_verified_at"], name: "index_users_on_paranoid_verified_at"
    t.index ["password_changed_at"], name: "index_users_on_password_changed_at"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
    t.index ["uuid_secure"], name: "index_users_on_uuid_secure", unique: true
    t.index ["uuid_token"], name: "index_users_on_uuid_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id"
    t.string "foreign_key_name", null: false
    t.integer "foreign_key_id"
    t.string "foreign_type"
    t.index ["foreign_key_name", "foreign_key_id", "foreign_type"], name: "index_version_associations_on_foreign_key"
    t.index ["version_id"], name: "index_version_associations_on_version_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.text "object_changes"
    t.integer "transaction_id"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
    t.index ["transaction_id"], name: "index_versions_on_transaction_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "facebook_accounts", "users"
  add_foreign_key "github_accounts", "users"
  add_foreign_key "google_accounts", "users"
  add_foreign_key "linkedin_accounts", "users"
end
