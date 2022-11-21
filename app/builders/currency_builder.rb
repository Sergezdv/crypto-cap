class CurrencyBuilder
  def initialize(asset, currency=nil)
    @asset = asset
    @currency = currency
  end

  def get_data
    {
      # id: currency.id,
      coin_cap_currency_id: currency&.coin_cap_currency_id || asset['id'],
      name: currency&.name || asset['name'],
      market_cap_usd: asset['marketCapUsd'],
      change_percent_1hr: change_percent(1.hour),
      change_percent_24hr: asset['changePercent24Hr'],
      change_percent_7d: change_percent(7.days),
    }
  end


  private

  attr_reader :asset, :currency

  def new_price
    # currency.price_movements.last.price_usd
    asset['priceUsd'].to_f
  end

  def change_percent(duration)
    return unless currency
    old_price = price_movement_by(duration)&.price_usd
    (new_price - old_price) / old_price * 100 if old_price
  end

  def price_movement_by(duration)
    duration = (duration - 5.minutes) # infelicity
    currency.price_movements.where(timestamp: ..duration.ago ).order(timestamp: :desc).first
  end
end
