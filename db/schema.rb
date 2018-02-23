# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180223191013) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.text "about"
    t.text "visa_box"
    t.string "slug"
    t.string "video"
    t.string "country_code"
    t.boolean "selective"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_countries_on_slug", unique: true
  end

  create_table "event_confirmations", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "phone"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_confirmations_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "branch"
    t.string "name"
    t.string "subject"
    t.string "location"
    t.text "description"
    t.datetime "event_date_time"
    t.datetime "event_date_time_end"
    t.string "slug"
    t.decimal "google_map_latitude"
    t.decimal "google_map_longitude"
    t.string "cover_file_name"
    t.string "cover_content_type"
    t.integer "cover_file_size"
    t.datetime "cover_updated_at"
    t.string "event_image_file_name"
    t.string "event_image_content_type"
    t.integer "event_image_file_size"
    t.datetime "event_image_updated_at"
    t.string "event_image1_file_name"
    t.string "event_image1_content_type"
    t.integer "event_image1_file_size"
    t.datetime "event_image1_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_events_on_slug", unique: true
  end

  create_table "fairs", force: :cascade do |t|
    t.string "branch"
    t.string "name"
    t.string "location"
    t.text "description"
    t.datetime "fair_date_time"
    t.datetime "fair_date_time_end"
    t.string "slug"
    t.decimal "google_map_latitude"
    t.decimal "google_map_longitude"
    t.string "cover_file_name"
    t.string "cover_content_type"
    t.integer "cover_file_size"
    t.datetime "cover_updated_at"
    t.string "fair_image_file_name"
    t.string "fair_image_content_type"
    t.integer "fair_image_file_size"
    t.datetime "fair_image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_fairs_on_slug", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "posts", force: :cascade do |t|
    t.string "branch"
    t.string "name"
    t.text "body"
    t.datetime "published_at"
    t.string "cover_file_name"
    t.string "cover_content_type"
    t.integer "cover_file_size"
    t.datetime "cover_updated_at"
    t.string "post_image_file_name"
    t.string "post_image_content_type"
    t.integer "post_image_file_size"
    t.datetime "post_image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_member_id"
    t.index ["team_member_id"], name: "index_posts_on_team_member_id"
    t.index [nil], name: "index_posts_on_slug", unique: true
  end

  create_table "schools", force: :cascade do |t|
    t.string "branch"
    t.string "name"
    t.text "about"
    t.text "summary"
    t.string "slug"
    t.string "video"
    t.string "category"
    t.string "link"
    t.string "cover_file_name"
    t.string "cover_content_type"
    t.integer "cover_file_size"
    t.datetime "cover_updated_at"
    t.string "school_image_file_name"
    t.string "school_image_content_type"
    t.integer "school_image_file_size"
    t.datetime "school_image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "country_id"
    t.index ["country_id"], name: "index_schools_on_country_id"
    t.index ["slug"], name: "index_schools_on_slug", unique: true
  end

  create_table "team_members", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.string "surname"
    t.string "position"
    t.string "phone"
    t.string "social"
    t.string "branch", default: "All", null: false
    t.string "profile_image_file_name"
    t.string "profile_image_content_type"
    t.integer "profile_image_file_size"
    t.datetime "profile_image_updated_at"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_team_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_team_members_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_team_members_on_slug", unique: true
  end

end
