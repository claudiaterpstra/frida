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

ActiveRecord::Schema.define(version: 20170612144406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artworks", force: :cascade do |t|
    t.string   "message"
    t.integer  "lecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["lecture_id"], name: "index_artworks_on_lecture_id", using: :btree
    t.index ["user_id"], name: "index_artworks_on_user_id", using: :btree
  end

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "course_reviews", force: :cascade do |t|
    t.string   "content"
    t.integer  "rating"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["course_id"], name: "index_course_reviews_on_course_id", using: :btree
    t.index ["user_id"], name: "index_course_reviews_on_user_id", using: :btree
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "price"
    t.integer  "rating"
    t.string   "category"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "published"
    t.text     "materials"
    t.integer  "duration"
    t.index ["user_id"], name: "index_courses_on_user_id", using: :btree
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string   "content"
    t.integer  "artwork_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "author_id"
    t.index ["artwork_id"], name: "index_feedbacks_on_artwork_id", using: :btree
    t.index ["author_id"], name: "index_feedbacks_on_author_id", using: :btree
  end

  create_table "lectures", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "course_id"
    t.index ["course_id"], name: "index_lectures_on_course_id", using: :btree
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "notified_by_id"
    t.integer  "feedback_id"
    t.boolean  "read",           default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["feedback_id"], name: "index_notifications_on_feedback_id", using: :btree
    t.index ["notified_by_id"], name: "index_notifications_on_notified_by_id", using: :btree
    t.index ["user_id"], name: "index_notifications_on_user_id", using: :btree
  end

  create_table "participations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_participations_on_course_id", using: :btree
    t.index ["user_id"], name: "index_participations_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "token"
    t.datetime "token_expiry"
    t.text     "biodata"
    t.boolean  "teacher",                default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "artworks", "lectures"
  add_foreign_key "course_reviews", "courses"
  add_foreign_key "courses", "users"
  add_foreign_key "feedbacks", "artworks"
  add_foreign_key "lectures", "courses"
  add_foreign_key "notifications", "feedbacks"
  add_foreign_key "notifications", "users"
  add_foreign_key "notifications", "users", column: "notified_by_id"
  add_foreign_key "participations", "courses"
  add_foreign_key "participations", "users"
end
