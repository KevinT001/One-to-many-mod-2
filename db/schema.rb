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

ActiveRecord::Schema.define(version: 2022_10_11_053835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fishes", force: :cascade do |t|
    t.string "name"
    t.integer "avg_length"
    t.boolean "catch_and_release_only"
    t.bigint "lake_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lake_id"], name: "index_fishes_on_lake_id"
  end

  create_table "lakes", force: :cascade do |t|
    t.string "name"
    t.integer "max_depth"
    t.boolean "allows_public_fishing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "fishes", "lakes"
end
