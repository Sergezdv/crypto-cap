class Currency < ApplicationRecord
  has_many :price_movements
end
