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

ActiveRecord::Schema.define(version: 20170729234724) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.float    "funding_goal"
    t.float    "raised"
    t.datetime "deadline"
    t.boolean  "goal_met?"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "creator_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "fundings", force: :cascade do |t|
    t.float    "amount"
    t.string   "object"
    t.float    "application_fee", default: 0.25
    t.boolean  "capture",         default: true
    t.string   "description"
    t.string   "destination"
    t.string   "transfer_group"
    t.string   "on_behalf_of"
    t.string   "source"
    t.string   "currency",        default: "USD"
    t.string   "metadata",        default: "{}"
    t.string   "stripe_id"
    t.integer  "user_id"
    t.integer  "campaign_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "username"
    t.string   "token"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "customer_id"
    t.index ["email"], name: "index_users_on_email", using: :btree
  end

end
