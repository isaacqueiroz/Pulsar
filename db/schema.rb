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

ActiveRecord::Schema.define(:version => 20131106173011) do

  create_table "details", :force => true do |t|
    t.integer  "area"
    t.string   "title"
    t.text     "description"
    t.integer  "evaluation_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "details", ["evaluation_id"], :name => "index_details_on_evaluation_id"

  create_table "evaluations", :force => true do |t|
    t.string   "peso"
    t.integer  "mmagraa"
    t.integer  "pgordura"
    t.integer  "mtorax"
    t.integer  "mabdomen"
    t.integer  "mcintura"
    t.integer  "mquadril"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.date     "dataeval"
    t.integer  "altura"
    t.integer  "pgordurai"
    t.integer  "pesodes"
    t.integer  "imc"
    t.integer  "metbasal"
    t.integer  "mantbracod"
    t.integer  "mantbracoe"
    t.integer  "mbracod"
    t.integer  "mbracoe"
    t.integer  "mcoxad"
    t.integer  "mcoxae"
    t.integer  "mpantd"
    t.integer  "mpante"
    t.integer  "mbicepsd"
    t.integer  "mbicepse"
    t.integer  "mgordura"
  end

  add_index "evaluations", ["user_id"], :name => "index_evaluations_on_user_id"

  create_table "exams", :force => true do |t|
    t.integer  "hdl"
    t.integer  "ldl"
    t.integer  "vldl"
    t.integer  "tgo"
    t.integer  "tgp"
    t.integer  "ggt"
    t.integer  "fosfatase"
    t.integer  "bilirrubina"
    t.integer  "acidourico"
    t.integer  "ureia"
    t.integer  "creatina"
    t.integer  "cknac"
    t.integer  "glicose"
    t.integer  "tsh"
    t.integer  "t4"
    t.integer  "fsh"
    t.integer  "prolactina"
    t.integer  "testosterona"
    t.integer  "estradiol"
    t.integer  "lh"
    t.integer  "lpo"
    t.integer  "t3"
    t.integer  "lipoprot"
    t.integer  "androst"
    t.integer  "cortisol"
    t.integer  "homocist"
    t.integer  "shbg"
    t.integer  "teslivre"
    t.integer  "insulina"
    t.integer  "densidade"
    t.integer  "ph"
    t.integer  "sedimento"
    t.integer  "soridutoras"
    t.integer  "catomico"
    t.integer  "hemoglobina"
    t.integer  "cristais"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "user_id"
  end

  create_table "goals", :force => true do |t|
    t.string   "meta"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "goals", ["user_id"], :name => "index_goals_on_user_id"

  create_table "postural_assessments", :force => true do |t|
    t.boolean  "cifose"
    t.boolean  "lordose"
    t.boolean  "escoliose"
    t.boolean  "artrose"
    t.boolean  "hernia"
    t.text     "obs"
    t.string   "image1"
    t.string   "image2"
    t.string   "image3"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "postural_assessments", ["user_id"], :name => "index_postural_assessments_on_user_id"

  create_table "profiles", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "address1"
    t.string   "address2"
    t.string   "phone"
    t.date     "birthdate"
    t.date     "signdate"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
