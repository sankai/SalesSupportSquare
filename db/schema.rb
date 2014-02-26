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

ActiveRecord::Schema.define(version: 20140204104137) do

  create_table "ankens", force: true do |t|
    t.string   "status"
    t.string   "mitmr_no"
    t.string   "mitmr_eda_no"
    t.integer  "kkk_id"
    t.integer  "sk_shain_id"
    t.integer  "e_bmn_id"
    t.integer  "e_shain_id"
    t.string   "mitmr_name"
    t.string   "jch_name"
    t.string   "prj_name"
    t.string   "prj_code"
    t.string   "hiyo_kbn"
    t.integer  "uribunya_id"
    t.string   "shubetsu"
    t.string   "theme2"
    t.integer  "enduser_id"
    t.string   "uri_project"
    t.integer  "nensho_yosan"
    t.integer  "kingaku"
    t.date     "jch_yotei_date"
    t.string   "jch_no"
    t.date     "jch_date"
    t.date     "snksgy_sn_date"
    t.string   "snksgy_sign"
    t.integer  "genka_kingaku"
    t.integer  "jch_arari_kingaku"
    t.float    "jch_arari_rate"
    t.integer  "uri_y_zennen"
    t.integer  "uri_y_jinen"
    t.integer  "uri_j_zennen"
    t.integer  "uri_j_jinen"
    t.string   "jch_kakudo"
    t.string   "eigyo_comment"
    t.string   "jky_memo_comp"
    t.string   "jky_memo_keyman"
    t.string   "jky_memo_kadai"
    t.date     "teian_irai_date"
    t.date     "teian_date"
    t.string   "c_hacchusho_no"
    t.date     "mtmr_irai_date"
    t.date     "mtmr_kaito_kigen_date"
    t.date     "mtmr_date"
    t.date     "anken_chusi_date"
    t.date     "anken_kanryo_date"
    t.date     "anken_syukka_date"
    t.string   "seikyusho"
    t.date     "seikyusho_date"
    t.date     "gassan_seikyu_date"
    t.string   "anken_kbn"
    t.integer  "jch_bmn_id"
    t.integer  "sei_shain_id"
    t.integer  "sei_bmn_id"
    t.string   "jch_status"
    t.string   "seikyu_status"
    t.string   "sakusei_step"
    t.string   "renban"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uri_y_final"
    t.string   "sk_bmn_code"
    t.string   "sk_bmn_name"
  end

  create_table "bmns", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "d_email"
    t.string   "d_shian_name"
  end

  create_table "endusers", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kkks", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mailrecords", force: true do |t|
    t.integer  "shain_id"
    t.integer  "mailsent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mailsents", force: true do |t|
    t.integer  "mailtemplate_id"
    t.datetime "sent_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mailtemplates", force: true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "banner"
    t.text     "content"
    t.text     "trailer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shains", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "uribunyas", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "urijs", force: true do |t|
    t.integer  "year"
    t.integer  "month"
    t.float    "amount"
    t.integer  "anken_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "e_shain_id"
    t.integer  "e_bmn_id"
  end

  create_table "uriys", force: true do |t|
    t.integer  "year"
    t.integer  "month"
    t.float    "amount"
    t.integer  "anken_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "e_shain_id"
    t.integer  "e_bmn_id"
  end

end
