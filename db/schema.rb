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

ActiveRecord::Schema.define(:version => 20110329045340) do

  create_table "grids", :force => true do |t|
    t.integer  "project_id"
    t.integer  "columns"
    t.string   "width"
    t.string   "gutter_width"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "layouts", :force => true do |t|
    t.integer  "project_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "libraries", :force => true do |t|
    t.integer  "project_id"
    t.integer  "account_id"
    t.string   "name"
    t.boolean  "global"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.integer  "project_id"
    t.string   "name"
    t.text     "markup"
    t.text     "styles"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "overview"
    t.text     "announcement"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
