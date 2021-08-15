# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_14_194922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "discounts", force: :cascade do |t|
    t.decimal "discount_percentage"
    t.date "starts_at"
    t.integer "kind_of_plan"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "profile"
    t.text "email_ciphertext"
    t.string "email_bidx"
    t.index ["email_bidx"], name: "index_members_on_email_bidx", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "people", force: :cascade do |t|
    t.integer "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "name_ciphertext"
    t.text "address_ciphertext"
    t.text "birthdate_ciphertext"
    t.text "phone_ciphertext"
    t.text "cpf_ciphertext"
    t.date "birthdate_bidx"
    t.date "start_date_bidx"
    t.text "start_date_ciphertext"
    t.index ["birthdate_bidx"], name: "index_people_on_birthdate_bidx", unique: true
    t.index ["start_date_bidx"], name: "index_people_on_start_date_bidx", unique: true
  end

  create_table "rents", force: :cascade do |t|
    t.decimal "rental_amount"
    t.date "starts_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "student_plans", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "tuition_fee_id", null: false
    t.bigint "discount_id", null: false
    t.string "rent_inclusion"
    t.integer "due_day"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["discount_id"], name: "index_student_plans_on_discount_id"
    t.index ["person_id"], name: "index_student_plans_on_person_id"
    t.index ["tuition_fee_id"], name: "index_student_plans_on_tuition_fee_id"
  end

  create_table "tuition_fees", force: :cascade do |t|
    t.integer "weekly_classes"
    t.decimal "fee"
    t.date "validity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "student_plans", "discounts"
  add_foreign_key "student_plans", "people"
  add_foreign_key "student_plans", "tuition_fees"
end
