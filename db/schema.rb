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

ActiveRecord::Schema[7.1].define(version: 2023_10_07_033828) do
  create_table "goal_profits", force: :cascade do |t|
    t.date "registered_date"
    t.integer "goal_id", null: false
    t.integer "profit"
    t.float "variation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goal_id"], name: "index_goal_profits_on_goal_id"
  end

  create_table "goals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "graphs", force: :cascade do |t|
    t.string "name"
    t.integer "list_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "goal_profits", "goals"
end
