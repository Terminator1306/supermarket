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

ActiveRecord::Schema.define(version: 20160122161103) do

  create_table "items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "quantity"
    t.integer  "shoppinglist_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "items", ["shoppinglist_id"], name: "index_items_on_shoppinglist_id"

  create_table "manipulators", force: :cascade do |t|
    t.string   "m_name"
    t.string   "password"
    t.integer  "m_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "p_name"
    t.string   "description"
    t.float    "price"
    t.integer  "quantity"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "shoppinglists", force: :cascade do |t|
    t.integer  "manipulator_type"
    t.float    "total"
    t.datetime "time"
    t.integer  "manipulator_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
