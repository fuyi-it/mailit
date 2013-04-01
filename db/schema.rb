# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130331181535) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.string   "account"
    t.string   "password"
    t.integer  "balance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "adapter_id"
  end

  add_index "accounts", ["adapter_id"], :name => "index_accounts_on_adapter_id"
  add_index "accounts", ["user_id"], :name => "index_accounts_on_user_id"

  create_table "adapters", :force => true do |t|
    t.string   "name"
    t.string   "account_agent"
    t.string   "password"
    t.integer  "balance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "qq"
    t.text     "detail"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "http"
    t.integer  "datafrom_id"
    t.string   "tagstring"
  end

  add_index "customers", ["datafrom_id"], :name => "index_customers_on_datafrom_id"

  create_table "datafroms", :force => true do |t|
    t.string   "name"
    t.string   "detail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phone_kinds", :force => true do |t|
    t.string   "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phone_numbers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "phone_kind_id"
    t.integer  "customer_id"
  end

  add_index "phone_numbers", ["customer_id"], :name => "index_phone_numbers_on_customer_id"
  add_index "phone_numbers", ["phone_kind_id"], :name => "index_phone_numbers_on_phone_kind_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "contact"
    t.string   "http"
    t.string   "qq_group"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "detail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "send_msgs", :force => true do |t|
    t.string   "title"
    t.text     "msg"
    t.text     "mobile"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
  end

  add_index "send_msgs", ["owner_id"], :name => "index_send_msgs_on_owner_id"

  create_table "sms_params", :force => true do |t|
    t.string   "name"
    t.string   "kind"
    t.string   "url"
    t.string   "user"
    t.string   "pwd"
    t.string   "msg"
    t.string   "mobile"
    t.string   "encode"
    t.string   "url_other"
    t.boolean  "is_post"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "adapter_id"
  end

  add_index "sms_params", ["adapter_id"], :name => "index_sms_params_on_adapter_id"

  create_table "softs", :force => true do |t|
    t.string   "name"
    t.string   "download"
    t.string   "register"
    t.string   "run"
    t.text     "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
  end

  add_index "softs", ["project_id"], :name => "index_softs_on_project_id"

  create_table "tag_assignments", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tag_id"
    t.integer  "customer_id"
  end

  add_index "tag_assignments", ["customer_id"], :name => "index_tag_assignments_on_customer_id"
  add_index "tag_assignments", ["tag_id"], :name => "index_tag_assignments_on_tag_id"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tutorials", :force => true do |t|
    t.string   "tech_info"
    t.text     "detail"
    t.text     "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "soft_id"
    t.string   "title"
    t.string   "download_url"
    t.string   "category"
  end

  add_index "tutorials", ["soft_id"], :name => "index_tutorials_on_soft_id"

  create_table "users", :force => true do |t|
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                   :default => "active"
    t.datetime "key_timestamp"
    t.string   "phone"
    t.string   "unit"
    t.integer  "balance"
    t.integer  "role_id"
  end

  add_index "users", ["role_id"], :name => "index_users_on_role_id"
  add_index "users", ["state"], :name => "index_users_on_state"

end
