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

ActiveRecord::Schema.define(version: 2022_03_23_160352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "belts", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.integer "modality"
    t.integer "color"
    t.date "start_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_belts_on_person_id"
  end

  create_table "class_instructors", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "pakua_class_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pakua_class_id"], name: "index_class_instructors_on_pakua_class_id"
    t.index ["person_id"], name: "index_class_instructors_on_person_id"
  end

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

  create_table "pakua_classes", force: :cascade do |t|
    t.integer "modality"
    t.integer "day_of_week"
    t.integer "hour"
    t.integer "minutes"
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "student_plan_id", null: false
    t.boolean "paid"
    t.decimal "payment_fee"
    t.date "due_date"
    t.string "payment_link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "paid_fee"
    t.index ["student_plan_id"], name: "index_payments_on_student_plan_id"
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
    t.text "information"
    t.text "school_level_ciphertext"
    t.text "occupation_ciphertext"
    t.text "civil_status_ciphertext"
    t.text "marketing_ciphertext"
    t.text "other_option_ciphertext"
    t.text "cep_ciphertext"
    t.integer "school_level_bidx"
    t.integer "marketing_bidx"
    t.integer "civil_status_bidx"
    t.text "email_ciphertext"
    t.text "status_ciphertext"
    t.integer "status_bidx"
    t.string "email_bidx"
    t.string "cpf_bidx"
    t.index ["birthdate_bidx"], name: "index_people_on_birthdate_bidx"
    t.index ["civil_status_bidx"], name: "index_people_on_civil_status_bidx"
    t.index ["cpf_bidx"], name: "index_people_on_cpf_bidx", unique: true
    t.index ["email_bidx"], name: "index_people_on_email_bidx"
    t.index ["marketing_bidx"], name: "index_people_on_marketing_bidx"
    t.index ["school_level_bidx"], name: "index_people_on_school_level_bidx"
    t.index ["start_date_bidx"], name: "index_people_on_start_date_bidx"
    t.index ["status_bidx"], name: "index_people_on_status_bidx"
  end

  create_table "rents", force: :cascade do |t|
    t.decimal "rental_amount"
    t.date "starts_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "student_plans", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.integer "weekly_classes"
    t.integer "kind_of_plan"
    t.string "rent_inclusion"
    t.integer "due_day"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_student_plans_on_person_id"
  end

  create_table "tuition_fees", force: :cascade do |t|
    t.integer "weekly_classes"
    t.decimal "fee"
    t.date "validity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "belts", "people"
  add_foreign_key "class_instructors", "pakua_classes"
  add_foreign_key "class_instructors", "people"
  add_foreign_key "payments", "student_plans"
  add_foreign_key "student_plans", "people"
end
