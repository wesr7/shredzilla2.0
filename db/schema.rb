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

ActiveRecord::Schema.define(version: 20150527221333) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: :cascade do |t|
    t.string   "name"
    t.date     "start_date"
    t.integer  "current_day"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "challenges_programs", id: false, force: :cascade do |t|
    t.integer "challenge_id", null: false
    t.integer "program_id",   null: false
  end

  create_table "days", force: :cascade do |t|
    t.integer  "day"
    t.string   "description"
    t.string   "option_1"
    t.string   "option_2"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "exercises", force: :cascade do |t|
    t.string   "name"
    t.string   "video"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "teams_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "team_id", null: false
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
    t.integer  "day_id"
    t.integer  "exercise_id"
    t.string   "hold"
    t.string   "reps"
    t.string   "sets"
    t.string   "timer"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "workouts", ["day_id"], name: "index_workouts_on_day_id", using: :btree
  add_index "workouts", ["exercise_id"], name: "index_workouts_on_exercise_id", using: :btree

  add_foreign_key "identities", "users"
  add_foreign_key "programs", "teams"
  add_foreign_key "workouts", "days"
  add_foreign_key "workouts", "exercises"
end
