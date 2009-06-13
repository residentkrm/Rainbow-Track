# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090327013150) do

  create_table "global_configs", :force => true do |t|
    t.string "name"
    t.string "value"
  end

  create_table "hash_statuses", :force => true do |t|
    t.string "name"
  end

  create_table "hash_types", :force => true do |t|
    t.string "name"
  end

  create_table "hash_values", :force => true do |t|
    t.string  "hash_value"
    t.string  "plaintext"
    t.integer "hash_type_id"
    t.integer "hash_status_id"
    t.integer "session_id"
  end

  create_table "hash_values_users", :id => false, :force => true do |t|
    t.integer "hash_value_id"
    t.integer "user_id"
  end

  create_table "hosts", :force => true do |t|
    t.string "address"
  end

  create_table "hosts_users", :id => false, :force => true do |t|
    t.integer "host_id"
    t.integer "user_id"
  end

  create_table "passwords", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "session_statuses", :force => true do |t|
    t.string "name"
  end

  create_table "sessions", :force => true do |t|
    t.integer  "session_status_id"
    t.datetime "start"
    t.datetime "end"
    t.float    "duration"
  end

  create_table "users", :force => true do |t|
    t.string "username"
  end

end
