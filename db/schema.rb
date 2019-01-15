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

ActiveRecord::Schema.define(version: 20181126195859) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "question_attributes", force: :cascade do |t|
    t.integer  "question_id",        limit: 4
    t.text     "description",        limit: 65535
    t.string   "panel_title",        limit: 255
    t.text     "panel_description",  limit: 65535
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "question_dimensions", force: :cascade do |t|
    t.integer  "count",                 limit: 4,     null: false
    t.integer  "question_id",           limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "image_file_name",       limit: 255
    t.string   "image_content_type",    limit: 255
    t.integer  "image_file_size",       limit: 4
    t.datetime "image_updated_at"
    t.string   "legend_description",    limit: 255
    t.string   "help_text_image",       limit: 255
    t.text     "help_text_description", limit: 65535
  end

  create_table "question_sets", force: :cascade do |t|
    t.integer  "survey_id",              limit: 4
    t.string   "participant_identifier", limit: 255
    t.string   "title",                  limit: 255
    t.string   "subtitle",               limit: 255
    t.boolean  "used"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "question_set_id",             limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "question_image_file_name",    limit: 255
    t.string   "question_image_content_type", limit: 255
    t.integer  "question_image_file_size",    limit: 4
    t.datetime "question_image_updated_at"
    t.string   "panel_title",                 limit: 255
    t.text     "panel_description",           limit: 65535
  end

  create_table "response_attributes", force: :cascade do |t|
    t.integer  "response_id",        limit: 4
    t.text     "description",        limit: 65535
    t.string   "panel_title",        limit: 255
    t.text     "panel_description",  limit: 65535
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "response_dimensions", force: :cascade do |t|
    t.integer  "count",                 limit: 4
    t.integer  "response_id",           limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "image_file_name",       limit: 255
    t.string   "image_content_type",    limit: 255
    t.integer  "image_file_size",       limit: 4
    t.datetime "image_updated_at"
    t.string   "legend_description",    limit: 255
    t.string   "help_text_image",       limit: 255
    t.text     "help_text_description", limit: 65535
  end

  create_table "response_sets", force: :cascade do |t|
    t.string   "user_token",             limit: 255
    t.integer  "survey_id",              limit: 4
    t.datetime "completed_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "participant_identifier", limit: 255
    t.string   "first",                  limit: 255
    t.string   "second",                 limit: 255
    t.string   "third",                  limit: 255
    t.string   "fourth",                 limit: 255
    t.string   "fifth",                  limit: 255
    t.string   "sixth",                  limit: 255
  end

  create_table "responses", force: :cascade do |t|
    t.integer  "response_set_id", limit: 4
    t.integer  "question_id",     limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "title",           limit: 255
    t.string   "subtitle",        limit: 255
    t.integer  "weight",          limit: 4
  end

  create_table "surveys", force: :cascade do |t|
    t.string   "study_identifier",                  limit: 255
    t.integer  "total_n",                           limit: 4
    t.string   "default_set_title",                 limit: 255
    t.text     "default_set_subtitle",              limit: 65535
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "default_legend_image_file_name",    limit: 255
    t.string   "default_legend_image_content_type", limit: 255
    t.integer  "default_legend_image_file_size",    limit: 4
    t.datetime "default_legend_image_updated_at"
    t.string   "default_legend_description",        limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
