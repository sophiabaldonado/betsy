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

ActiveRecord::Schema.define(version: 20160512224153) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "billings", force: :cascade do |t|
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "email",           null: false
    t.string   "cc",              null: false
    t.integer  "cvv",             null: false
    t.integer  "billing_zip",     null: false
    t.string   "address",         null: false
    t.string   "address2"
    t.string   "city",            null: false
    t.string   "state",           null: false
    t.integer  "zip",             null: false
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "expiration_date", null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer  "quantity",   null: false
    t.integer  "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "session_id"
    t.string   "user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "photo_url"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "quantity",   null: false
    t.string   "name",       null: false
    t.decimal  "price",      null: false
    t.string   "status",     null: false
    t.integer  "order_id",   null: false
    t.integer  "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "status",            null: false
    t.datetime "confirmation_date", null: false
    t.integer  "billing_id",        null: false
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "order_number",      null: false
    t.decimal  "total",             null: false
  end

  create_table "product_categories", force: :cascade do |t|
    t.integer  "product_id",  null: false
    t.integer  "category_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",        null: false
    t.decimal  "price",       null: false
    t.string   "description"
    t.integer  "user_id",     null: false
    t.integer  "inventory",   null: false
    t.string   "photo_url"
    t.boolean  "retired",     null: false
    t.boolean  "deleted",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating",     null: false
    t.string   "comment"
    t.integer  "product_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.boolean  "merchant",        null: false
    t.string   "photo_url"
    t.string   "biography"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
