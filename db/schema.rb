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

ActiveRecord::Schema.define(version: 20180324210225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inform_infecteds", force: :cascade do |t|
    t.integer "survivor_send_id"
    t.integer "survivor_infected_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "survivor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "survivor_id"
    t.integer "inventory_id"
    t.integer "tipo"
  end

  create_table "survivors", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "gender"
    t.integer "lat"
    t.integer "long"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "infected"
  end

  create_table "virus", force: :cascade do |t|
    t.integer "survivor_send_id"
    t.integer "survivor_infected_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
