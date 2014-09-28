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

ActiveRecord::Schema.define(:version => 20140331225841) do

  create_table "films", :force => true do |t|
    t.text     "title"
    t.date     "published"
    t.string   "imdb"
    t.string   "genere"
    t.string   "quality"
    t.string   "size"
    t.string   "runtime"
    t.string   "link"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "year"
    t.string   "cover"
    t.string   "imbdbcode"
    t.string   "rating"
    t.string   "magnet"
    t.string   "sizebytes"
  end

  create_table "films_users", :id => false, :force => true do |t|
    t.date    "subscribed"
    t.integer "film_id"
    t.integer "user_id"
  end

  add_index "films_users", ["film_id", "user_id"], :name => "index_films_users_on_film_id_and_user_id"

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uuid"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
