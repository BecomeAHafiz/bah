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

ActiveRecord::Schema.define(:version => 20130210120846) do

  create_table "ayahs", :force => true do |t|
    t.integer  "surah_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "position"
  end

  create_table "ayahs_users", :id => false, :force => true do |t|
    t.integer "ayah_id"
    t.integer "user_id"
  end

  add_index "ayahs_users", ["ayah_id", "user_id"], :name => "index_ayahs_users_on_ayah_id_and_user_id"
  add_index "ayahs_users", ["user_id", "ayah_id"], :name => "index_ayahs_users_on_user_id_and_ayah_id"

  create_table "recitators", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "recitators_surahs", :id => false, :force => true do |t|
    t.integer "recitator_id", :default => 0, :null => false
    t.integer "surah_id",     :default => 0, :null => false
  end

  add_index "recitators_surahs", ["recitator_id", "surah_id"], :name => "index_recitators_surahs_on_recitator_id_and_surah_id"

  create_table "surahs", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "position"
    t.integer  "nbAyahs"
  end

  create_table "surahs_users", :id => false, :force => true do |t|
    t.integer "surah_id"
    t.integer "user_id"
  end

  add_index "surahs_users", ["surah_id", "user_id"], :name => "index_surahs_users_on_surah_id_and_user_id"
  add_index "surahs_users", ["user_id", "surah_id"], :name => "index_surahs_users_on_user_id_and_surah_id"

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
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
