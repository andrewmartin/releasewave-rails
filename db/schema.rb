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

ActiveRecord::Schema.define(version: 2023_07_24_163429) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "type"
    t.text "content"
    t.bigint "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["artist_id"], name: "index_articles_on_artist_id"
    t.index ["slug"], name: "index_articles_on_slug", unique: true
  end

  create_table "artist_releases", force: :cascade do |t|
    t.bigint "artist_id"
    t.bigint "release_id"
    t.index ["artist_id"], name: "index_artist_releases_on_artist_id"
    t.index ["release_id"], name: "index_artist_releases_on_release_id"
  end

  create_table "artist_tags", force: :cascade do |t|
    t.bigint "artist_id"
    t.bigint "tag_id"
    t.index ["artist_id"], name: "index_artist_tags_on_artist_id"
    t.index ["tag_id"], name: "index_artist_tags_on_tag_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "bandcamp"
    t.string "facebook"
    t.string "spotify"
    t.string "soundcloud"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
    t.string "slug"
    t.string "website"
    t.string "youtube"
    t.string "itunes"
    t.string "twitter"
    t.text "short_description"
    t.string "instagram"
    t.index ["name"], name: "index_artists_on_name", unique: true
    t.index ["slug"], name: "index_artists_on_slug", unique: true
  end

  create_table "artists_releases", id: false, force: :cascade do |t|
    t.bigint "release_id", null: false
    t.bigint "artist_id", null: false
    t.index ["release_id", "artist_id"], name: "index_artists_releases_on_release_id_and_artist_id"
  end

  create_table "embeds", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "media", force: :cascade do |t|
    t.string "file_file_name"
    t.string "file_content_type"
    t.bigint "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "height"
    t.integer "width"
    t.string "caption"
  end

  create_table "options", force: :cascade do |t|
    t.integer "featured_date_window_before"
    t.integer "featured_date_window_after"
    t.string "name"
    t.binary "data"
  end

  create_table "release_embeds", force: :cascade do |t|
    t.bigint "release_id"
    t.bigint "embed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["embed_id"], name: "index_release_embeds_on_embed_id"
    t.index ["release_id"], name: "index_release_embeds_on_release_id"
  end

  create_table "releases", force: :cascade do |t|
    t.integer "artist_id"
    t.string "name"
    t.text "description"
    t.date "release_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
    t.string "slug"
    t.string "buy"
    t.text "short_description"
    t.boolean "featured"
    t.index ["slug"], name: "index_releases_on_slug", unique: true
  end

  create_table "reviews", force: :cascade do |t|
    t.string "name"
    t.bigint "release_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.integer "user_id"
    t.string "score"
    t.index ["release_id"], name: "index_reviews_on_release_id"
    t.index ["slug"], name: "index_reviews_on_slug", unique: true
  end

  create_table "shared_tags", force: :cascade do |t|
    t.bigint "artist_id"
    t.bigint "release_id"
    t.bigint "article_id"
    t.integer "tag_id"
    t.index ["article_id"], name: "index_shared_tags_on_article_id"
    t.index ["artist_id"], name: "index_shared_tags_on_artist_id"
    t.index ["release_id"], name: "index_shared_tags_on_release_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.bigint "artist_id"
    t.bigint "release_id"
    t.bigint "article_id"
    t.string "slug"
    t.index ["article_id"], name: "index_tags_on_article_id"
    t.index ["artist_id"], name: "index_tags_on_artist_id"
    t.index ["release_id"], name: "index_tags_on_release_id"
    t.index ["slug"], name: "index_tags_on_slug", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_admin"
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "shared_tags", "articles"
  add_foreign_key "shared_tags", "artists"
  add_foreign_key "shared_tags", "releases"
end
