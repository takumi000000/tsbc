# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_05_21_063406) do
  create_table "answers", force: :cascade do |t|
    t.string "student_number"
    t.string "department"
    t.string "course"
    t.string "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "content"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name", null: false
    t.string "s_code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["s_code"], name: "index_courses_on_s_code"
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "q_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name", null: false
    t.string "c_code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["c_code"], name: "index_subjects_on_c_code", unique: true
  end

  add_foreign_key "courses", "subjects", column: "s_code", primary_key: "c_code"
end
