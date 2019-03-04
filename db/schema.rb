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

ActiveRecord::Schema.define(version: 2019_03_04_022358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bus_companies", force: :cascade do |t|
    t.string "name", null: false
    t.string "cnpj", limit: 18, null: false
    t.string "city", default: "Não se aplica"
    t.string "neighborhood", default: "Não se aplica"
    t.string "address", default: "Não se aplica"
    t.index ["cnpj"], name: "index_bus_companies_on_cnpj"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_cities_on_name"
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "source_city_id"
    t.bigint "destination_city_id"
    t.decimal "value", precision: 5, scale: 2, default: "0.0"
    t.bigint "bus_company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_company_id"], name: "index_tickets_on_bus_company_id"
    t.index ["destination_city_id"], name: "index_tickets_on_destination_city_id"
    t.index ["source_city_id"], name: "index_tickets_on_source_city_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "month"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "universities", force: :cascade do |t|
    t.string "name", null: false
    t.string "abbreviation", null: false
    t.string "cnpj", limit: 18, null: false
    t.bigint "city_id"
    t.string "neighborhood", default: "Não se aplica"
    t.string "address", default: "Não se aplica"
    t.index ["abbreviation"], name: "index_universities_on_abbreviation"
    t.index ["city_id"], name: "index_universities_on_city_id"
    t.index ["cnpj"], name: "index_universities_on_cnpj"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.string "name", null: false
    t.string "cpf", limit: 14
    t.string "rg", limit: 10
    t.date "birthdate"
    t.string "father_name", default: "Não consta"
    t.string "mother_name"
    t.string "address", default: ""
    t.string "phone", default: "Não consta"
    t.string "mobile_phone", default: "Não consta"
    t.string "bank_account"
    t.string "bank_agency"
    t.integer "bank_option"
    t.bigint "university_id"
    t.string "course"
    t.integer "semester"
    t.string "place"
    t.date "semester_start"
    t.date "semester_end"
    t.integer "ticket_responsible_id"
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["university_id"], name: "index_users_on_university_id"
  end

  add_foreign_key "tickets", "bus_companies"
  add_foreign_key "transactions", "users"
  add_foreign_key "universities", "cities"
  add_foreign_key "users", "users", column: "ticket_responsible_id"
end
