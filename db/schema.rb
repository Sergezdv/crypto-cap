# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_221_121_002_934) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'currencies', force: :cascade do |t|
    t.string 'coin_cap_currency_id'
    t.string 'name'
    t.decimal 'market_cap_usd'
    t.string 'change_percent_1hr'
    t.string 'change_percent_24hr'
    t.string 'change_percent_7d'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'price_movements', force: :cascade do |t|
    t.decimal 'price_usd'
    t.bigint 'currency_id'
    t.datetime 'timestamp'
    t.index ['currency_id'], name: 'index_price_movements_on_currency_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'name'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'price_movements', 'currencies'
end
