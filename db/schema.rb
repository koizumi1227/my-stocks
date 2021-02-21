# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_21_084154) do

  create_table "articles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "url", null: false
    t.string "title", null: false
    t.string "description"
    t.string "translated_title"
    t.string "translated_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stocks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "tick", null: false
    t.string "company_name"
    t.string "sector"
    t.string "industry"
    t.string "country"
    t.float "per"
    t.float "eps"
    t.float "market_cap"
    t.float "forward_per"
    t.float "eps_estimate_next_year"
    t.float "income"
    t.float "peg"
    t.float "eps_estimate_next_quarter"
    t.float "short_float"
    t.float "sales"
    t.float "psr"
    t.float "eps_current_year"
    t.float "short_ratio"
    t.float "bps"
    t.float "pbr"
    t.float "eps_next_year"
    t.float "roa"
    t.float "target_price"
    t.float "cfps"
    t.float "pcfr"
    t.float "eps_next_5_year"
    t.float "roe"
    t.float "dividend"
    t.float "pfcfr"
    t.float "eps_past_5_year"
    t.float "roi"
    t.float "beta"
    t.float "dividend_yield"
    t.float "quick_ratio"
    t.float "sales_past_5_year"
    t.float "gross_margin"
    t.float "atr"
    t.float "current_ratio"
    t.float "sales_q_q"
    t.float "operating_margin"
    t.float "rsi_14"
    t.float "der"
    t.float "eps_q_q"
    t.float "profit_margin"
    t.float "rel_volume"
    t.float "lt_der"
    t.float "payout"
    t.float "price"
    t.float "recom"
    t.float "sma_20"
    t.float "volume"
    t.float "change_price_ratio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
