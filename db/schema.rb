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

ActiveRecord::Schema.define(version: 20171201124734) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "buvette_items", force: :cascade do |t|
    t.string   "name"
    t.integer  "quantity"
    t.boolean  "order_more"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coach_functions", force: :cascade do |t|
    t.integer  "team_id"
    t.string   "coach_role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_coach_functions_on_team_id", using: :btree
  end

  create_table "coaches", force: :cascade do |t|
    t.string   "diplome"
    t.boolean  "pack_deal"
    t.integer  "coach_function_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["coach_function_id"], name: "index_coaches_on_coach_function_id", using: :btree
  end

  create_table "fields", force: :cascade do |t|
    t.boolean  "digital"
    t.boolean  "usable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "team_id"
    t.integer  "field_id"
    t.datetime "date_and_time"
    t.string   "oposing_team"
    t.boolean  "home"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["field_id"], name: "index_games_on_field_id", using: :btree
    t.index ["parent_id"], name: "index_games_on_parent_id", using: :btree
    t.index ["team_id"], name: "index_games_on_team_id", using: :btree
  end

  create_table "menages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "shop_item_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["shop_item_id"], name: "index_orders_on_shop_item_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "parents", force: :cascade do |t|
    t.integer  "menage_id"
    t.string   "f_name"
    t.string   "l_name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menage_id"], name: "index_parents_on_menage_id", using: :btree
  end

  create_table "players", force: :cascade do |t|
    t.string   "short_size"
    t.string   "shirt_size"
    t.boolean  "short",      default: false
    t.boolean  "shirt",      default: false
    t.boolean  "coti_paid",  default: false
    t.integer  "menage_id"
    t.integer  "team_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["menage_id"], name: "index_players_on_menage_id", using: :btree
    t.index ["team_id"], name: "index_players_on_team_id", using: :btree
  end

  create_table "shop_items", force: :cascade do |t|
    t.string   "name"
    t.string   "size"
    t.integer  "quantity"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.date     "before"
    t.date     "after"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainings", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "field_id"
    t.string   "day"
    t.time     "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_id"], name: "index_trainings_on_field_id", using: :btree
    t.index ["team_id"], name: "index_trainings_on_team_id", using: :btree
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
    t.string   "f_name"
    t.string   "l_name"
    t.string   "profile_pic"
    t.date     "dob"
    t.string   "phone"
    t.boolean  "is_admin",               default: false, null: false
    t.boolean  "is_coach",               default: false
    t.boolean  "is_player",              default: true
    t.boolean  "is_parent",              default: false
    t.boolean  "is_active",              default: true
    t.integer  "coach_id"
    t.integer  "player_id"
    t.integer  "parent_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["coach_id"], name: "index_users_on_coach_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["parent_id"], name: "index_users_on_parent_id", using: :btree
    t.index ["player_id"], name: "index_users_on_player_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "coach_functions", "teams"
  add_foreign_key "coaches", "coach_functions"
  add_foreign_key "games", "fields"
  add_foreign_key "games", "parents"
  add_foreign_key "games", "teams"
  add_foreign_key "orders", "shop_items"
  add_foreign_key "orders", "users"
  add_foreign_key "parents", "menages"
  add_foreign_key "players", "menages"
  add_foreign_key "players", "teams"
  add_foreign_key "trainings", "fields"
  add_foreign_key "trainings", "teams"
end
