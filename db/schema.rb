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

ActiveRecord::Schema.define(version: 20170222162132) do

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.integer  "points"
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "kind",        default: 1
    t.integer  "meat"
  end

  create_table "reports", force: :cascade do |t|
    t.string   "name"
    t.integer  "kind"
    t.decimal  "bills"
    t.decimal  "visa"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal  "expenses"
  end

end
