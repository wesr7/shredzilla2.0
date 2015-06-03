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

ActiveRecord::Schema.define(version: 20150603172825) do

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

  create_table "dailychallenges", force: :cascade do |t|
    t.integer  "day_id"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "dailychallenges", ["day_id"], name: "index_dailychallenges_on_day_id", using: :btree

  create_table "days", force: :cascade do |t|
    t.integer  "program_id"
    t.integer  "day"
    t.string   "description"
    t.string   "option_1"
    t.string   "option_2"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "days", ["program_id"], name: "index_days_on_program_id", using: :btree

  create_table "exercises", force: :cascade do |t|
    t.string   "name"
    t.string   "video"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "histories", force: :cascade do |t|
    t.integer  "challenge_id"
    t.integer  "program_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "histories", ["challenge_id"], name: "index_histories_on_challenge_id", using: :btree
  add_index "histories", ["program_id"], name: "index_histories_on_program_id", using: :btree

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

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.boolean  "owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "memberships", ["team_id"], name: "index_memberships_on_team_id", using: :btree
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id", using: :btree

  create_table "programs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "roles", ["user_id"], name: "index_roles_on_user_id", using: :btree

  create_table "scores", force: :cascade do |t|
    t.integer  "history_id"
    t.integer  "user_id"
    t.integer  "day"
    t.integer  "food"
    t.integer  "workout"
    t.integer  "sleep"
    t.integer  "challenge"
    t.integer  "daily_update"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "scores", ["history_id"], name: "index_scores_on_history_id", using: :btree
  add_index "scores", ["user_id"], name: "index_scores_on_user_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.integer  "challenge_id"
    t.integer  "program_id"
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "teams", ["challenge_id"], name: "index_teams_on_challenge_id", using: :btree
  add_index "teams", ["program_id"], name: "index_teams_on_program_id", using: :btree

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

  add_foreign_key "dailychallenges", "days"
  add_foreign_key "days", "programs"
  add_foreign_key "histories", "challenges"
  add_foreign_key "histories", "programs"
  add_foreign_key "identities", "users"
  add_foreign_key "memberships", "teams"
  add_foreign_key "memberships", "users"
  add_foreign_key "roles", "users"
  add_foreign_key "scores", "histories"
  add_foreign_key "scores", "users"
  add_foreign_key "teams", "challenges"
  add_foreign_key "teams", "programs"
  add_foreign_key "workouts", "days"
  add_foreign_key "workouts", "exercises"
end
