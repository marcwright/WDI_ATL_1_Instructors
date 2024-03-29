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

ActiveRecord::Schema.define(version: 20140825172929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beans", force: true do |t|
    t.string   "name"
    t.string   "roast"
    t.string   "origin"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pairings", force: true do |t|
    t.integer  "bean_id"
    t.integer  "pastry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pairings", ["bean_id"], name: "index_pairings_on_bean_id", using: :btree
  add_index "pairings", ["pastry_id"], name: "index_pairings_on_pastry_id", using: :btree

  create_table "pastries", force: true do |t|
    t.string   "name"
    t.string   "dept"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
