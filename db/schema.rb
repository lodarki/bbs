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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131031130423) do

  create_table "article_details", force: true do |t|
    t.integer  "for_num_article_id"
    t.text     "detail"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "article_details", ["for_num_article_id"], name: "index_article_details_on_for_num_article_id", using: :btree
  add_index "article_details", ["user_id"], name: "index_article_details_on_user_id", using: :btree

  create_table "for_num_articles", force: true do |t|
    t.integer  "for_num_name_id"
    t.string   "title",           default: "Blank Theme", null: false
    t.text     "detail"
    t.integer  "user_id"
    t.integer  "permission",      default: 0,             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "for_num_articles", ["for_num_name_id"], name: "index_for_num_articles_on_for_num_name_id", using: :btree
  add_index "for_num_articles", ["user_id"], name: "index_for_num_articles_on_user_id", using: :btree

  create_table "for_num_names", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "right",                  default: 1,      null: false
    t.string   "type",                   default: "User", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
