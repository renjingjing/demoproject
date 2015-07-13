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

ActiveRecord::Schema.define(version: 20150713182044) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.string   "avatar"
    t.integer  "avatar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "attachments", ["avatar_id"], name: "index_attachments_on_avatar_id", using: :btree

  create_table "avatars", force: :cascade do |t|
    t.string   "title"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "review_id"
    t.integer  "user_id"
    t.integer  "producer_id"
    t.integer  "product_id"
  end

  add_index "avatars", ["imageable_type", "imageable_id"], name: "index_avatars_on_imageable_type_and_imageable_id", using: :btree
  add_index "avatars", ["producer_id"], name: "index_avatars_on_producer_id", using: :btree
  add_index "avatars", ["product_id"], name: "index_avatars_on_product_id", using: :btree
  add_index "avatars", ["review_id"], name: "index_avatars_on_review_id", using: :btree
  add_index "avatars", ["user_id"], name: "index_avatars_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favourites", force: :cascade do |t|
    t.string   "body"
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "favourites", ["product_id"], name: "index_favourites_on_product_id", using: :btree
  add_index "favourites", ["user_id"], name: "index_favourites_on_user_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.string   "title"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "producers", force: :cascade do |t|
    t.string   "name"
    t.string   "information"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.float    "price"
    t.string   "sku"
    t.integer  "quantity"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
    t.integer  "producer_id"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["producer_id"], name: "index_products_on_producer_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.string   "body"
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
  end

  add_index "reviews", ["product_id"], name: "index_reviews_on_product_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "address1"
    t.string   "address2"
    t.string   "note"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "image"
  end

  add_foreign_key "attachments", "avatars"
  add_foreign_key "avatars", "producers"
  add_foreign_key "avatars", "products"
  add_foreign_key "avatars", "reviews"
  add_foreign_key "avatars", "users"
  add_foreign_key "favourites", "products"
  add_foreign_key "favourites", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "producers"
  add_foreign_key "reviews", "products"
  add_foreign_key "reviews", "users"
end
