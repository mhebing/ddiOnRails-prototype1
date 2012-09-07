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

ActiveRecord::Schema.define(:version => 20120907074911) do

  create_table "baskets", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "make_public"
  end

  create_table "baskets_variable_groups", :id => false, :force => true do |t|
    t.integer "basket_id"
    t.integer "variable_group_id"
  end

  create_table "concept_groups", :force => true do |t|
    t.string   "name"
    t.string   "label"
    t.text     "abstract"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "parent_id"
  end

  create_table "concepts", :force => true do |t|
    t.string   "name"
    t.string   "label"
    t.text     "abstract"
    t.integer  "concept_group_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "data_collections", :force => true do |t|
    t.string   "name"
    t.string   "label"
    t.text     "abstract"
    t.integer  "study_unit_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "label"
    t.text     "abstract"
    t.integer  "study_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "logical_products", :force => true do |t|
    t.string   "name"
    t.string   "label"
    t.text     "abstract"
    t.integer  "study_unit_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "physical_data_products", :force => true do |t|
    t.string   "name"
    t.string   "label"
    t.integer  "group_id"
    t.integer  "logical_product_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "physical_instances", :force => true do |t|
    t.integer  "physical_data_product_id"
    t.string   "name"
    t.string   "label"
    t.text     "description"
    t.string   "filename"
    t.string   "format"
    t.string   "fingerprint"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "publications", :force => true do |t|
    t.string   "author"
    t.string   "name"
    t.integer  "year"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "publications_user_profiles", :id => false, :force => true do |t|
    t.integer "publication_id"
    t.integer "user_profile_id"
  end

  create_table "questions", :force => true do |t|
    t.string   "name"
    t.string   "label"
    t.string   "fix_name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "studies", :force => true do |t|
    t.string   "name"
    t.string   "label"
    t.text     "abstract"
    t.text     "universe"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "study_units", :force => true do |t|
    t.string   "name"
    t.string   "label"
    t.text     "abstract"
    t.integer  "study_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "make_public"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.boolean  "admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "variable_categories", :force => true do |t|
    t.integer  "variable_id"
    t.integer  "value"
    t.string   "label"
    t.integer  "frequency"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "variable_groups", :force => true do |t|
    t.string   "name"
    t.string   "label"
    t.integer  "logical_product_id"
    t.integer  "question_id"
    t.integer  "concept_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "variable_statistics", :force => true do |t|
    t.integer "variable_id"
    t.decimal "value"
    t.string  "statistic"
  end

  create_table "variables", :force => true do |t|
    t.string   "name"
    t.string   "label"
    t.integer  "physical_data_product_id"
    t.integer  "variable_group_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

end
