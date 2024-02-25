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

ActiveRecord::Schema[7.1].define(version: 2024_02_25_054912) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batches", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_batches_on_name", unique: true
  end

  create_table "departments", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_departments_on_name", unique: true
  end

  create_table "exam_halls", force: :cascade do |t|
    t.string "no", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["no"], name: "index_exam_halls_on_no", unique: true
  end

  create_table "exam_schedules", force: :cascade do |t|
    t.datetime "date", precision: nil
    t.bigint "exam_hall_id", null: false
    t.bigint "batch_id", null: false
    t.bigint "subject_id", null: false
    t.bigint "department_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_exam_schedules_on_batch_id"
    t.index ["department_id"], name: "index_exam_schedules_on_department_id"
    t.index ["exam_hall_id"], name: "index_exam_schedules_on_exam_hall_id"
    t.index ["subject_id"], name: "index_exam_schedules_on_subject_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.integer "gender", limit: 2
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "department_id", null: false
    t.bigint "batch_id", null: false
    t.string "reg_no"
    t.index ["batch_id"], name: "index_students_on_batch_id"
    t.index ["department_id"], name: "index_students_on_department_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name", null: false
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "name", null: false
    t.integer "role", limit: 2, default: 0
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "exam_schedules", "batches"
  add_foreign_key "exam_schedules", "departments"
  add_foreign_key "exam_schedules", "exam_halls"
  add_foreign_key "exam_schedules", "subjects"
  add_foreign_key "students", "batches"
  add_foreign_key "students", "departments"
end
