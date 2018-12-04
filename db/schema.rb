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

ActiveRecord::Schema.define(version: 2018_12_02_221433) do

  create_table "announcements", force: :cascade do |t|
    t.text "content"
    t.string "title"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "hash_id"
    t.boolean "approved"
    t.boolean "rejected", default: false
    t.boolean "final", default: false
    t.index ["hash_id"], name: "index_announcements_on_hash_id", unique: true
    t.index ["user_id", "created_at"], name: "index_announcements_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_announcements_on_user_id"
  end

  create_table "announcements_class_years", id: false, force: :cascade do |t|
    t.integer "announcement_id"
    t.integer "class_year_id"
  end

  create_table "blog_posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "hash_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hash_id"], name: "index_blog_posts_on_hash_id"
    t.index ["user_id"], name: "index_blog_posts_on_user_id"
  end

  create_table "class_years", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "class_years_users", id: false, force: :cascade do |t|
    t.integer "class_year_id", null: false
    t.integer "user_id", null: false
  end

  create_table "club_members", force: :cascade do |t|
    t.integer "club_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "president_id"
    t.string "hash_id"
    t.boolean "final", default: false
    t.boolean "approved", default: false
    t.boolean "rejected", default: false
    t.string "motto"
    t.index ["president_id"], name: "index_clubs_on_president_id"
  end

  create_table "cycle_days", force: :cascade do |t|
    t.string "letter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["letter"], name: "index_cycle_days_on_letter", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "location"
    t.text "description"
    t.datetime "start_time"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "end_time"
    t.string "hash_id"
    t.boolean "approved", default: false
    t.integer "club_id"
    t.boolean "rejected", default: false
    t.boolean "final", default: false
    t.index ["club_id"], name: "index_events_on_club_id"
    t.index ["start_time", "user_id", "created_at"], name: "index_events_on_start_time_and_user_id_and_created_at"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "events_class_years", id: false, force: :cascade do |t|
    t.integer "event_id"
    t.integer "class_year_id"
  end

  create_table "events_users", id: false, force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "user_id", null: false
  end

  create_table "mod_actions", force: :cascade do |t|
    t.integer "user_id"
    t.text "description"
    t.text "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_mod_actions_on_user_id"
  end

  create_table "reports", force: :cascade do |t|
    t.text "report"
    t.string "link"
    t.integer "user_id"
    t.text "response"
    t.integer "responder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["responder_id"], name: "index_reports_on_responder_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.boolean "approve", default: false
    t.boolean "blog", default: false
    t.boolean "moderate", default: false
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "teach", default: false
    t.boolean "banned", default: false
    t.boolean "faculty_mod", default: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id", null: false
    t.integer "user_id", null: false
  end

  create_table "school_days", force: :cascade do |t|
    t.integer "cycle_day_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.index ["cycle_day_id"], name: "index_school_days_on_cycle_day_id"
    t.index ["date"], name: "index_school_days_on_date", unique: true
  end

  create_table "sections", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.string "hash_id"
    t.string "user_id"
  end

  create_table "sections_tasks", id: false, force: :cascade do |t|
    t.integer "section_id", null: false
    t.integer "task_id", null: false
  end

  create_table "sections_users", id: false, force: :cascade do |t|
    t.integer "section_id", null: false
    t.integer "user_id", null: false
    t.index ["section_id", "user_id"], name: "index_sections_users_on_section_id_and_user_id", unique: true
    t.index ["user_id"], name: "index_sections_users_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "hash_id"
    t.index ["hash_id"], name: "index_subjects_on_hash_id", unique: true
  end

  create_table "subjects_timeslots", id: false, force: :cascade do |t|
    t.integer "subject_id", null: false
    t.integer "timeslot_id", null: false
  end

  create_table "taskees", force: :cascade do |t|
    t.integer "user_id"
    t.integer "task_id"
    t.boolean "completed", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "time_estimate"
    t.index ["task_id"], name: "index_taskees_on_task_id"
    t.index ["user_id"], name: "index_taskees_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.datetime "duedate"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "hash_id"
  end

  create_table "timeslots", force: :cascade do |t|
    t.integer "day"
    t.integer "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "hash_id"
    t.string "remember_digest"
    t.string "provider"
    t.string "oauth_token"
    t.string "uid"
    t.datetime "oauth_expires_at"
    t.string "biography"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["hash_id"], name: "index_users_on_hash_id", unique: true
  end

end
