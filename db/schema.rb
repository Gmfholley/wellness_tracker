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

ActiveRecord::Schema.define(version: 20150818222346) do

  create_table "challenge_participants", force: :cascade do |t|
    t.integer  "challenge_id"
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "challenge_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "challenges", force: :cascade do |t|
    t.string   "name"
    t.integer  "challenge_type_id"
    t.integer  "num_type"
    t.integer  "num_in_type"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "organization_id"
    t.string   "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "token"
  end

  add_index "challenges", ["token"], name: "index_challenges_on_token", unique: true

  create_table "cheers", force: :cascade do |t|
    t.integer  "exercise_event_id"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "cheers", ["user_id", "exercise_event_id"], name: "index_cheers_on_user_id_and_exercise_event_id", unique: true

  create_table "comments", force: :cascade do |t|
    t.integer  "exercise_event_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "exercise_events", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "exercise_type_id"
    t.integer  "intensity_id"
    t.datetime "date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.float    "num_units"
    t.integer  "exercise_unit_id"
  end

  create_table "exercise_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exercise_units", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "intensities", force: :cascade do |t|
    t.string   "name"
    t.integer  "point_adjustment"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "rule_eaches", force: :cascade do |t|
    t.integer  "challenge_id"
    t.integer  "time_period_id"
    t.integer  "exercise_unit_id"
    t.integer  "num_exercise_units"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "rule_qualifies", force: :cascade do |t|
    t.integer  "challenge_id"
    t.integer  "exercise_unit_id"
    t.integer  "num_exercise_units"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "rule_totals", force: :cascade do |t|
    t.integer  "challenge_id"
    t.integer  "exercise_unit_id"
    t.integer  "num_exercise_units"
    t.integer  "time_period_id"
    t.integer  "num_time_periods"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teams", ["token"], name: "index_teams_on_token", unique: true

  create_table "time_periods", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                           null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_picture"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token"

  create_table "users_users", id: false, force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users_users", ["user_id", "friend_id"], name: "index_users_users_on_user_id_and_friend_id", unique: true

end
