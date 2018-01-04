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

ActiveRecord::Schema.define(version: 20171204164942) do

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "creationreports", force: :cascade do |t|
    t.integer  "market_id"
    t.integer  "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "managers", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.integer  "yearofbirth"
    t.string   "tel"
    t.string   "email"
    t.text     "curriculum"
    t.string   "password"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.integer  "market_id"
  end

  add_index "managers", ["market_id"], name: "index_managers_on_market_id"

  create_table "markets", force: :cascade do |t|
    t.string   "address"
    t.string   "group"
    t.text     "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "status"
  end

  create_table "micropostreports", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "micropost_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "microposts", force: :cascade do |t|
    t.text     "content"
    t.integer  "vote"
    t.integer  "user_id"
    t.integer  "market_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "microposts", ["market_id"], name: "index_microposts_on_market_id"
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id"

  create_table "owners", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "market_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "stock"
    t.float    "price"
  end

  add_index "owners", ["market_id"], name: "index_owners_on_market_id"
  add_index "owners", ["product_id"], name: "index_owners_on_product_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "label"
    t.string   "package"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "shopper_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "requests", ["product_id"], name: "index_requests_on_product_id"
  add_index "requests", ["shopper_id"], name: "index_requests_on_shopper_id"

  create_table "shoppers", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "shoppers", ["user_id"], name: "index_shoppers_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.integer  "yearofbirth"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password"
    t.string   "password_digest"
  end

end
