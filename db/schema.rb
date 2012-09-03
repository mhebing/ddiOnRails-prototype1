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

ActiveRecord::Schema.define(:version => 20120903081039) do

  create_table "concept_groups", :force => true do |t|
    t.string   "name"
    t.string   "label"
    t.text     "abstract"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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

  create_table "variable_groups", :force => true do |t|
    t.string   "name"
    t.string   "label"
    t.integer  "logical_product_id"
    t.integer  "question_id"
    t.integer  "concept_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
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
