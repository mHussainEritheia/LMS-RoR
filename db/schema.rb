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

ActiveRecord::Schema[7.0].define(version: 2022_04_20_111226) do
  create_table "book_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_fines", force: :cascade do |t|
    t.float "amount"
    t.integer "user_id"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "issue_book_id"
    t.index ["issue_book_id"], name: "index_book_fines_on_issue_book_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.string "author"
    t.datetime "publication_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "book_category_id"
    t.boolean "availble", default: true
    t.index ["book_category_id"], name: "index_books_on_book_category_id"
  end

  create_table "issue_books", force: :cascade do |t|
    t.string "name"
    t.datetime "return_date"
    t.datetime "actual_return_date"
    t.boolean "returned"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "book_id"
    t.integer "user_id"
    t.index ["book_id"], name: "index_issue_books_on_book_id"
    t.index ["user_id"], name: "index_issue_books_on_user_id"
  end

  create_table "requested_books", force: :cascade do |t|
    t.integer "status"
    t.datetime "approved_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "book_id"
    t.index ["book_id"], name: "index_requested_books_on_book_id"
    t.index ["user_id"], name: "index_requested_books_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "gender"
    t.string "address"
    t.integer "mobile"
    t.integer "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "book_fines", "issue_books"
  add_foreign_key "books", "book_categories"
  add_foreign_key "issue_books", "books"
  add_foreign_key "issue_books", "users"
  add_foreign_key "requested_books", "books"
  add_foreign_key "requested_books", "users"
  add_foreign_key "users", "roles"
end
