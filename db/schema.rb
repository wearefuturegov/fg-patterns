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

ActiveRecord::Schema.define(version: 2019_06_21_143456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "life_events", force: :cascade do |t|
    t.string "name"
  end

  create_table "life_events_services", id: false, force: :cascade do |t|
    t.bigint "service_id", null: false
    t.bigint "life_event_id", null: false
    t.index ["service_id", "life_event_id"], name: "index_life_events_services_on_service_id_and_life_event_id"
  end

  create_table "patterns", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patterns_services", id: false, force: :cascade do |t|
    t.bigint "service_id", null: false
    t.bigint "pattern_id", null: false
    t.index ["service_id", "pattern_id"], name: "index_patterns_services_on_service_id_and_pattern_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "steps"
    t.string "organisation_types"
    t.string "suggester_email"
    t.string "suggester_organisation"
    t.boolean "transactional"
  end

end
