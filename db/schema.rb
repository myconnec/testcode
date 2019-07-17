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

ActiveRecord::Schema.define(version: 20190606115012) do

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 32
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "listing_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.text     "body",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "comments", ["listing_id"], name: "index_comments_on_listing_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "impressions", force: :cascade do |t|
    t.string   "impressionable_type", limit: 32
    t.integer  "impressionable_id",   limit: 4
    t.integer  "user_id",             limit: 4
    t.string   "controller_name",     limit: 32
    t.string   "action_name",         limit: 32
    t.string   "view_name",           limit: 32
    t.string   "request_hash",        limit: 256
    t.string   "ip_address",          limit: 39
    t.string   "session_hash",        limit: 32
    t.text     "message",             limit: 65535
    t.text     "referrer",            limit: 65535
    t.text     "params",              limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree

  create_table "listings", force: :cascade do |t|
    t.string   "title",              limit: 128
    t.text     "description",        limit: 65535
    t.string   "city",               limit: 32
    t.string   "state",              limit: 32
    t.string   "zipcode",            limit: 32
    t.string   "price",              limit: 32
    t.string   "address1",           limit: 32
    t.string   "address2",           limit: 32
    t.string   "ademail",            limit: 32
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id",        limit: 4
    t.integer  "subcategory_id",     limit: 4
    t.float    "latitude",           limit: 24
    t.float    "longitude",          limit: 24
    t.integer  "user_id",            limit: 4
    t.string   "media_file_name",    limit: 32
    t.string   "media_content_type", limit: 32
    t.integer  "media_file_size",    limit: 4
    t.datetime "media_updated_at"
    t.integer  "ending_at",          limit: 4,     default: 1563329342, null: false
  end

  add_index "listings", ["ending_at"], name: "index_listings_on_ending_at", using: :btree
  add_index "listings", ["user_id"], name: "index_listings_on_user_id", using: :btree

  create_table "models", force: :cascade do |t|
    t.string   "email",                  limit: 1024, default: "", null: false
    t.string   "encrypted_password",     limit: 1024, default: "", null: false
    t.string   "reset_password_token",   limit: 1024
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,    default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 32
    t.string   "last_sign_in_ip",        limit: 32
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "models", ["email"], name: "index_models_on_email", unique: true, using: :btree
  add_index "models", ["reset_password_token"], name: "index_models_on_reset_password_token", unique: true, using: :btree

  create_table "subcategories", force: :cascade do |t|
    t.string  "name",        limit: 32
    t.integer "category_id", limit: 4
    t.integer "chargable",   limit: 4,  default: 0, null: false
  end

  add_index "subcategories", ["chargable"], name: "subcategories_charable_index", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 1024, default: "", null: false
    t.string   "encrypted_password",     limit: 1024, default: "", null: false
    t.string   "reset_password_token",   limit: 1024
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,    default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 32
    t.string   "last_sign_in_ip",        limit: 32
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "username",               limit: 32
    t.string   "bio",                    limit: 1024
    t.string   "avatar_file_name",       limit: 1024
    t.string   "avatar_content_type",    limit: 32
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
    t.string   "stripe_token",           limit: 32
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id",   limit: 4
    t.string   "votable_type", limit: 32
    t.integer  "voter_id",     limit: 4
    t.string   "voter_type",   limit: 32
    t.boolean  "vote_flag"
    t.string   "vote_scope",   limit: 32
    t.integer  "vote_weight",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end
