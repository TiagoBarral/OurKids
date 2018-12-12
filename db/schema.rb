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

ActiveRecord::Schema.define(version: 2018_12_12_125028) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "children", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "child_id"
    t.string "title"
    t.text "description"
    t.date "date"
    t.integer "percentage"
    t.bigint "category_id"
    t.string "receipt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount_cents", default: 0, null: false
    t.index ["category_id"], name: "index_expenses_on_category_id"
    t.index ["child_id"], name: "index_expenses_on_child_id"
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "families", force: :cascade do |t|
    t.bigint "parent_id"
    t.bigint "coparent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "outstanding_parent_balance", default: 0
    t.integer "outstanding_coparent_balance", default: 0
    t.index ["coparent_id"], name: "index_families_on_coparent_id"
    t.index ["parent_id"], name: "index_families_on_parent_id"
  end

  create_table "family_children", force: :cascade do |t|
    t.bigint "family_id"
    t.bigint "child_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_family_children_on_child_id"
    t.index ["family_id"], name: "index_family_children_on_family_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "family_id"
    t.string "amount"
    t.integer "payment_method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "payer_id"
    t.bigint "payee_id"
    t.index ["family_id"], name: "index_payments_on_family_id"
    t.index ["payee_id"], name: "index_payments_on_payee_id"
    t.index ["payer_id"], name: "index_payments_on_payer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "expenses", "categories"
  add_foreign_key "expenses", "children"
  add_foreign_key "expenses", "users"
  add_foreign_key "family_children", "children"
  add_foreign_key "family_children", "families"
  add_foreign_key "payments", "families"
end
