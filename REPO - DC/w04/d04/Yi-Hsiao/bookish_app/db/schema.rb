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

ActiveRecord::Schema.define(version: 20140515193756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: true do |t|
    t.string   "name"
    t.date     "dob"
    t.string   "gender"
    t.boolean  "has_pseudonym"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "title"
    t.date     "release_date"
    t.string   "genre"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books_characters", id: false, force: true do |t|
    t.integer "book_id",      null: false
    t.integer "character_id", null: false
  end

  add_index "books_characters", ["book_id"], name: "index_books_characters_on_book_id", using: :btree
  add_index "books_characters", ["character_id"], name: "index_books_characters_on_character_id", using: :btree

  create_table "characters", force: true do |t|
    t.string   "name"
    t.string   "gender"
    t.string   "quirk"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
