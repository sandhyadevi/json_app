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

ActiveRecord::Schema.define(:version => 20131025070419) do

  create_table "invitations", :force => true do |t|
    t.integer  "trip_id"
    t.integer  "invited_id"
    t.string   "accepted"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tfriends", :force => true do |t|
    t.integer  "friend_id"
    t.integer  "friends_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tfriends", ["friend_id", "friends_id"], :name => "index_tfriends_on_friend_id_and_friends_id", :unique => true
  add_index "tfriends", ["friend_id"], :name => "index_tfriends_on_friend_id"
  add_index "tfriends", ["friends_id"], :name => "index_tfriends_on_friends_id"

  create_table "trips", :force => true do |t|
    t.integer  "user_id"
    t.integer  "trip_id"
    t.string   "title"
    t.string   "destination"
    t.date     "start_date"
    t.date     "end_date"
    t.float    "destination_lat"
    t.float    "destination_lng"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "trips", ["user_id"], :name => "index_trips_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "username"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "remember_token"
    t.string   "password_digest"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
