class CreatePriceMovements < ActiveRecord::Migration[7.0]
  def change
    create_table :price_movements do |t|
      t.decimal :price_usd

      t.timestamps
    end
  end
end
