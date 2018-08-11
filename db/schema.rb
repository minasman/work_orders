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

ActiveRecord::Schema.define(version: 20180811142855) do

  create_table "current_updates", force: :cascade do |t|
    t.date    "date"
    t.time    "time"
    t.string  "notes"
    t.string  "username"
    t.integer "workorder_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "store_number"
    t.string "email"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "position"
    t.string "password_digest"
  end

  create_table "workorders", force: :cascade do |t|
    t.string  "store_number"
    t.date    "date"
    t.time    "time"
    t.string  "issue"
    t.integer "user_id"
    t.integer "current_update_id"
    t.string  "status"
  end

end
