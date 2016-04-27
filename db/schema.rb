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

ActiveRecord::Schema.define(version: 20160422115155) do

  create_table "question_sets", force: :cascade do |t|
    t.integer  "survey_id",              limit: 4
    t.string   "participant_identifier", limit: 255
    t.text     "descriptors",            limit: 65535
    t.boolean  "used"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "question_set_id",             limit: 4
    t.text     "dimensions",                  limit: 65535
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "question_image_file_name",    limit: 255
    t.string   "question_image_content_type", limit: 255
    t.integer  "question_image_file_size",    limit: 4
    t.datetime "question_image_updated_at"
  end

  create_table "response_sets", force: :cascade do |t|
    t.string   "user_token",             limit: 255
    t.integer  "survey_id",              limit: 4
    t.datetime "completed_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "participant_identifier", limit: 255
  end

  create_table "responses", force: :cascade do |t|
    t.integer  "response_set_id", limit: 4
    t.integer  "question_id",     limit: 4
    t.text     "descriptors",     limit: 65535
    t.text     "dimensions",      limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.string   "study_identifier",           limit: 255
    t.integer  "total_n",                    limit: 4
    t.string   "default_set_title",          limit: 255
    t.text     "default_set_subtitle",       limit: 65535
    t.text     "default_legend_description", limit: 65535
    t.string   "default_legend_image",       limit: 255
    t.text     "legend_definitions",         limit: 65535
    t.text     "legend_help_text",           limit: 65535
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

end
