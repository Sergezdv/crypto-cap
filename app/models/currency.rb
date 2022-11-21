class Currency < ApplicationRecord
  has_many :price_movements

  def price_usd
    price_movements.last.price_usd
  end
end
