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

ActiveRecord::Schema.define(version: 20160710211124) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "about_pages", force: :cascade do |t|
    t.text     "description", default: "<hr><p>we decided once that the noise our\n          friends make should be documented. our aim is to produce some\n          special kind of artifacts, not just to pack music up, therefore we\n          focus much on cover art and all to make each thing really unique.\n          available stuff can be purchased at our discogs store. also,\n          everything can (and should) be listened and downloaded for free\n          at our bandcamp.</p>\n          <p>feel free to turn to us with whatever question you have.\n          002197@gmail.com</p><p>cheers from moscow</p>"
    t.datetime "created_at",                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               null: false
    t.datetime "updated_at",                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               null: false
  end

  create_table "albums", id: false, force: :cascade do |t|
    t.integer "release_id", null: false
    t.integer "band_id",    null: false
  end

  add_index "albums", ["band_id", "release_id"], name: "index_albums_on_band_id_and_release_id", using: :btree
  add_index "albums", ["release_id", "band_id"], name: "index_albums_on_release_id_and_band_id", using: :btree

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
    t.string   "name",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "url_name",    null: false
    t.text     "description"
  end

  add_index "bands", ["url_name"], name: "index_bands_on_url_name", using: :btree

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
    t.string   "name",        default: "Untiteled"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.text     "description"
  end

  create_table "tracks", force: :cascade do |t|
    t.string   "title",                         null: false
    t.integer  "position",                      null: false
    t.integer  "time",              default: 0, null: false
    t.integer  "release_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "song_file_name"
    t.string   "song_content_type"
    t.integer  "song_file_size"
    t.datetime "song_updated_at"
  end

  add_index "tracks", ["release_id"], name: "index_tracks_on_release_id", using: :btree

  add_foreign_key "albums", "bands"
  add_foreign_key "albums", "releases"
  add_foreign_key "band_images", "bands"
  add_foreign_key "release_images", "releases"
  add_foreign_key "tracks", "releases"
end
