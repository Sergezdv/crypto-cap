# frozen_string_literal: true

class CreatePriceMovements < ActiveRecord::Migration[7.0]
  def change
    create_table :price_movements do |t|
      t.decimal :price_usd
      t.references :currency, foreign_key: true
      t.datetime :timestamp

      # t.timestamps
    end
  end
end
