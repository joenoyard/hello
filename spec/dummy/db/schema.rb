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

ActiveRecord::Schema.define(version: 20140920192959) do

  create_table "active_sessions", force: true do |t|
    t.integer  "user_id"
    t.integer  "credential_id"
    t.string   "user_agent_string"
    t.string   "access_token"
    t.string   "ip"
    t.datetime "expires_at",        default: '2000-01-01 00:00:00'
    t.datetime "sudo_expires_at",   default: '2000-01-01 00:00:00'
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_sessions", ["access_token"], name: "index_active_sessions_on_access_token"
  add_index "active_sessions", ["credential_id"], name: "index_active_sessions_on_credential_id"
  add_index "active_sessions", ["user_id"], name: "index_active_sessions_on_user_id"

  create_table "addresses", force: true do |t|
    t.integer  "user_id"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id"

  create_table "credentials", force: true do |t|
    t.integer  "user_id"
    t.string   "strategy"
    t.string   "email"
    t.string   "username"
    t.string   "password_digest"
    t.integer  "active_sessions_count",      default: 0
    t.string   "password_token_digest"
    t.datetime "password_token_digested_at", default: '2000-01-01 00:00:00'
    t.string   "email_token_digest"
    t.datetime "email_token_digested_at",    default: '2000-01-01 00:00:00'
    t.datetime "email_confirmed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "credentials", ["user_id"], name: "index_credentials_on_user_id"

  create_table "some_credential_data", force: true do |t|
    t.integer  "credential_id"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "some_credential_data", ["credential_id"], name: "index_some_credential_data_on_credential_id"

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "role"
    t.string   "locale"
    t.string   "time_zone"
    t.integer  "credentials_count",     default: 0
    t.integer  "active_sessions_count", default: 0
    t.string   "city"
  end

end
