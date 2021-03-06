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

ActiveRecord::Schema.define(version: 20170312102719) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lists", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slack_channel_id", null: false
    t.string "webhook_token", null: false
    t.index ["webhook_token"], name: "index_lists_on_webhook_token", unique: true
  end

  create_table "lists_users", id: false, force: :cascade do |t|
    t.integer "list_id", null: false
    t.integer "user_id", null: false
    t.index ["list_id"], name: "index_lists_users_on_list_id"
    t.index ["user_id"], name: "index_lists_users_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "description", null: false
    t.bigint "list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.integer "status"
    t.index ["list_id"], name: "index_tasks_on_list_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "slack_id", null: false
    t.string "slack_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "lists_users", "lists"
  add_foreign_key "lists_users", "users"
  add_foreign_key "tasks", "lists"
  add_foreign_key "tasks", "users"
end
