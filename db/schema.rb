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

ActiveRecord::Schema.define(version: 20150523222607) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "days", force: :cascade do |t|
    t.integer  "number"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exercises", force: :cascade do |t|
    t.string   "video"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "hold"
    t.string   "reps"
    t.integer  "workout_id"
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["provider", "uid"], name: "index_identities_on_provider_and_uid", unique: true, using: :btree
  add_index "identities", ["provider"], name: "index_identities_on_provider", using: :btree
  add_index "identities", ["uid"], name: "index_identities_on_uid", using: :btree
  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "programs", force: :cascade do |t|
    t.string   "name"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "programs", ["team_id"], name: "index_programs_on_team_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "height"
    t.float    "weight"
    t.string   "email"
    t.string   "password_digest"
    t.string   "username"
    t.string   "fitness"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "workouts", force: :cascade do |t|
    t.string   "timer"
    t.string   "sets"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "day"
    t.string   "day_name"
  end

  add_foreign_key "identities", "users"
  add_foreign_key "programs", "teams"
end
