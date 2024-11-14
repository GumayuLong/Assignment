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

ActiveRecord::Schema[7.2].define(version: 2024_11_14_033432) do
  create_table "applications", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "job_id", null: false
    t.string "application_name"
    t.string "application_email"
    t.datetime "application_birthday"
    t.string "application_gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_applications_on_job_id"
  end

  create_table "companies", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", charset: "utf8mb3", force: :cascade do |t|
    t.string "title"
    t.bigint "company_id", null: false
    t.string "location"
    t.integer "job_type"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_jobs_on_company_id"
  end

  create_table "jobs_locations", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "job_id", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_jobs_locations_on_job_id"
    t.index ["location_id"], name: "index_jobs_locations_on_location_id"
  end

  create_table "locations", charset: "utf8mb3", force: :cascade do |t|
    t.string "locate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "applications", "jobs"
  add_foreign_key "jobs", "companies"
  add_foreign_key "jobs_locations", "jobs"
  add_foreign_key "jobs_locations", "locations"
end
