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

ActiveRecord::Schema.define(version: 20170527184558) do

  create_table "challenge_tests", force: :cascade do |t|
    t.text "inputs"
    t.string "return_value"
    t.integer "challenge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_challenge_tests_on_challenge_id"
  end

  create_table "challenges", force: :cascade do |t|
    t.string "title"
    t.string "function_name"
    t.text "description"
    t.text "parameters"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_challenges_on_user_id"
  end

  create_table "challenges_ratings", force: :cascade do |t|
    t.integer "quality"
    t.integer "difficulty"
    t.integer "user_id"
    t.integer "challenge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_challenges_ratings_on_challenge_id"
    t.index ["user_id"], name: "index_challenges_ratings_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_comments_on_parent_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "solutions", force: :cascade do |t|
    t.text "code"
    t.boolean "passing"
    t.integer "user_id"
    t.integer "challenge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_solutions_on_challenge_id"
    t.index ["user_id"], name: "index_solutions_on_user_id"
  end

  create_table "solutions_tags", force: :cascade do |t|
    t.integer "title"
    t.integer "user_id"
    t.integer "solution_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["solution_id"], name: "index_solutions_tags_on_solution_id"
    t.index ["user_id"], name: "index_solutions_tags_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.integer "challenge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_tags_on_challenge_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
