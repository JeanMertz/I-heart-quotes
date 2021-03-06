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

ActiveRecord::Schema.define(:version => 20120729194737) do

  create_table "cached_quotes", :force => true do |t|
    t.string   "hashed_key"
    t.text     "quoted_text",     :null => false
    t.string   "author"
    t.string   "sourcelink"
    t.integer  "quote_source_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "cached_quotes", ["hashed_key"], :name => "index_cached_quotes_on_hashed_key", :unique => true
  add_index "cached_quotes", ["quote_source_id"], :name => "index_cached_quotes_on_quote_source_id"

  create_table "custom_quotes_quotes", :force => true do |t|
    t.string   "quote_text", :null => false
    t.string   "author"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "kue_settings", :id => false, :force => true do |t|
    t.string   "key"
    t.text     "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "kue_settings", ["key"], :name => "index_kue_settings_on_key", :unique => true

  create_table "quote_sources", :force => true do |t|
    t.string   "source_url"
    t.text     "api_url",                                 :null => false
    t.string   "source_name"
    t.string   "response_type",       :default => "json"
    t.string   "quote_reference",                         :null => false
    t.string   "permalink_reference"
    t.string   "author_reference"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.integer  "weight",              :default => 1
  end

end
