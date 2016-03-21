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

ActiveRecord::Schema.define(version: 20160321130353) do

  create_table "domains", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "virtual_aliases", force: :cascade do |t|
    t.integer  "domain_id",   limit: 4,   null: false
    t.string   "source",      limit: 255, null: false
    t.string   "destination", limit: 255, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "virtual_aliases", ["domain_id"], name: "index_virtual_aliases_on_domain_id", using: :btree

  create_table "virtual_users", force: :cascade do |t|
    t.integer  "domain_id",  limit: 4,   null: false
    t.string   "password",   limit: 255, null: false
    t.string   "email",      limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "virtual_users", ["domain_id"], name: "index_virtual_users_on_domain_id", using: :btree

  add_foreign_key "virtual_aliases", "domains"
  add_foreign_key "virtual_users", "domains"
end
