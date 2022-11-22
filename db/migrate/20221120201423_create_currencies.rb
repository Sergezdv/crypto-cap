# frozen_string_literal: true

class CreateCurrencies < ActiveRecord::Migration[7.0]
  def change
    create_table :currencies do |t|
      t.string :coin_cap_currency_id
      t.string :name
      t.decimal :market_cap_usd
      t.string :change_percent_1hr
      t.string :change_percent_24hr
      t.string :change_percent_7d

      t.timestamps
    end
  end
end
