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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20160331075631) do
=======
ActiveRecord::Schema.define(version: 20160402065020) do
>>>>>>> feature/audit_log

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "case_files", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "organization_id"
    t.string   "case_type"
    t.string   "status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "documents", force: :cascade do |t|
    t.integer  "case_id"
    t.string   "file_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follow_ups", force: :cascade do |t|
    t.integer  "case_id"
    t.integer  "user_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "involvements", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "case_id"
    t.integer  "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issues", force: :cascade do |t|
    t.integer  "case_id"
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "tag_id",      default: 5
  end

  create_table "links", force: :cascade do |t|
    t.string   "url"
    t.integer  "case_file_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "filename"
  end

  add_index "links", ["case_file_id"], name: "index_links_on_case_file_id", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.text     "address"
    t.string   "industry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.date     "date_of_birth"
    t.string   "phone"
    t.string   "email"
    t.text     "address"
    t.string   "gender"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "tags", force: :cascade do |t|
    t.text     "name"
    t.integer  "parent_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",            null: false
    t.string   "contact_number"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.boolean  "is_admin"
    t.integer  "status"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  add_foreign_key "links", "case_files"
end
