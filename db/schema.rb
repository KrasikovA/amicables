# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160627212819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "about_pages", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "back_images", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "name"
  end

  create_table "band_images", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "band_id"
  end

  add_index "band_images", ["band_id"], name: "index_band_images_on_band_id", using: :btree

  create_table "bands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  create_table "bands_releases", id: false, force: :cascade do |t|
    t.integer "release_id", null: false
    t.integer "band_id",    null: false
  end

  add_index "bands_releases", ["band_id", "release_id"], name: "index_bands_releases_on_band_id_and_release_id", using: :btree
  add_index "bands_releases", ["release_id", "band_id"], name: "index_bands_releases_on_release_id_and_band_id", using: :btree

  create_table "release_images", force: :cascade do |t|
    t.integer  "release_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "release_images", ["release_id"], name: "index_release_images_on_release_id", using: :btree

  create_table "releases", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  create_table "tracks", force: :cascade do |t|
    t.string   "title"
    t.integer  "number"
    t.integer  "time"
    t.integer  "release_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "song_file_name"
    t.string   "song_content_type"
    t.integer  "song_file_size"
    t.datetime "song_updated_at"
  end

  add_index "tracks", ["release_id"], name: "index_tracks_on_release_id", using: :btree

  add_foreign_key "band_images", "bands"
  add_foreign_key "bands_releases", "bands"
  add_foreign_key "bands_releases", "releases"
  add_foreign_key "release_images", "releases"
  add_foreign_key "tracks", "releases"
end
