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

ActiveRecord::Schema.define(version: 20131028170649) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.integer  "service_id"
    t.integer  "supply_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "qty"
  end

  add_index "items", ["order_id"], name: "index_items_on_order_id", using: :btree
  add_index "items", ["service_id"], name: "index_items_on_service_id", using: :btree
  add_index "items", ["supply_id"], name: "index_items_on_supply_id", using: :btree

  create_table "orders", force: true do |t|
    t.integer  "refers_month"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_orders", force: true do |t|
    t.integer  "service_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "service_orders", ["order_id"], name: "index_service_orders_on_order_id", using: :btree
  add_index "service_orders", ["service_id"], name: "index_service_orders_on_service_id", using: :btree

  create_table "services", force: true do |t|
    t.string   "description"
    t.integer  "qty"
    t.decimal  "value",       precision: 20, scale: 2
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "services", ["category_id"], name: "index_services_on_category_id", using: :btree

  create_table "supplies", force: true do |t|
    t.string   "description"
    t.string   "unit"
    t.integer  "qty"
    t.decimal  "value",       precision: 20, scale: 2
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "supplies", ["category_id"], name: "index_supplies_on_category_id", using: :btree

  create_table "supply_orders", force: true do |t|
    t.integer  "supply_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "supply_orders", ["order_id"], name: "index_supply_orders_on_order_id", using: :btree
  add_index "supply_orders", ["supply_id"], name: "index_supply_orders_on_supply_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "nickname"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
