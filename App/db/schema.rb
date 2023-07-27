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

ActiveRecord::Schema[7.0].define(version: 2023_01_23_152222) do
  create_table "adresses", force: :cascade do |t|
    t.string "street_name"
    t.integer "street_number", precision: 38, null: false
    t.string "city", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.integer "user_id", precision: 38, null: false
    t.index ["user_id", "name"], name: "index_adresses_on_user_id_and_name", unique: true
    t.index ["user_id"], name: "index_adresses_on_user_id"
  end

  create_table "ingredients_prices", force: :cascade do |t|
    t.integer "cheese_price", precision: 38, null: false
    t.integer "ham_price", precision: 38, null: false
    t.integer "sauce_price", precision: 38, null: false
    t.integer "pineapple_price", precision: 38, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.index ["name"], name: "index_ingredients_prices_on_name", unique: true
  end

  create_table "pizza_orders", force: :cascade do |t|
    t.integer "total_price", precision: 38
    t.integer "ingredients_multiplayer", precision: 38, null: false
    t.datetime "date_of_order"
    t.integer "pizza_type_id", precision: 38, null: false
    t.integer "pizza_size_id", precision: 38, null: false
    t.integer "adress_id", precision: 38, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pizzeria_point_id", precision: 38, null: false
    t.integer "user_id", precision: 38, null: false
    t.index ["adress_id"], name: "index_pizza_orders_on_adress_id"
    t.index ["pizza_size_id"], name: "index_pizza_orders_on_pizza_size_id"
    t.index ["pizza_type_id"], name: "index_pizza_orders_on_pizza_type_id"
    t.index ["pizzeria_point_id"], name: "index_pizza_orders_on_pizzeria_point_id"
    t.index ["user_id"], name: "index_pizza_orders_on_user_id"
  end

  create_table "pizza_sizes", force: :cascade do |t|
    t.integer "p_size", precision: 38, null: false
    t.integer "basic_price", precision: 38, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.index ["name"], name: "index_pizza_sizes_on_name", unique: true
  end

  create_table "pizza_types", force: :cascade do |t|
    t.integer "required_cheese", precision: 38, null: false
    t.integer "required_sauce", precision: 38, null: false
    t.integer "required_ham", precision: 38, null: false
    t.integer "required_pineapple", precision: 38, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.index ["name"], name: "index_pizza_types_on_name", unique: true
  end

  create_table "pizzeria_points", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ingredients_price_id", precision: 38, null: false
    t.index ["ingredients_price_id"], name: "index_pizzeria_points_on_ingredients_price_id"
    t.index ["name"], name: "index_pizzeria_points_on_name", unique: true
  end

  create_table "storages", force: :cascade do |t|
    t.integer "available_cheese", precision: 38, null: false
    t.integer "available_ham", precision: 38, null: false
    t.integer "available_sauce", precision: 38, null: false
    t.integer "available_pineapple", precision: 38, null: false
    t.integer "pizzeria_point_id", precision: 38, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.index ["name"], name: "index_storages_on_name", unique: true
    t.index ["pizzeria_point_id"], name: "index_storages_on_pizzeria_point_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.integer "phone_number", precision: 38, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "adresses", "users"
  add_foreign_key "pizza_orders", "adresses"
  add_foreign_key "pizza_orders", "pizza_sizes"
  add_foreign_key "pizza_orders", "pizza_types"
  add_foreign_key "pizza_orders", "pizzeria_points"
  add_foreign_key "pizza_orders", "users"
  add_foreign_key "pizzeria_points", "ingredients_prices"
  add_foreign_key "storages", "pizzeria_points"
end
