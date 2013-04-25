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

ActiveRecord::Schema.define(:version => 20130425155823) do

  create_table "cards", :force => true do |t|
    t.string "name"
    t.float  "rate"
  end

  create_table "stamps", :force => true do |t|
    t.integer "card_id"
    t.string  "initials"
    t.string  "note"
    t.float   "duration"
    t.date    "completed_at"
    t.string  "tags"
  end

  add_index "stamps", ["card_id"], :name => "index_stamps_on_card_id"

end
