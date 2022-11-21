class Currencies::FetchHistoryPricesService
  def initialize(coin_cap_currency_ids)
    @coin_cap_currency_ids = coin_cap_currency_ids
  end

  def fetch_history_and_create
    coin_ids = coin_cap_currency_ids - Currency.pluck(:coin_cap_currency_id)
    return if coin_ids.blank?
    assets = Integrations::CoinCap.new.assets( coin_ids )
    currencies = crate_currencies(assets)
    create_history_prices(currencies)
    Currencies::FetchPricesService.new(assets: assets, skip_prices: true).fetch_and_create
  end

  private

  attr_reader :coin_cap_currency_ids

  def crate_currencies(assets)
    create_currencies_data = []
    assets['data'].each do |asset|
      create_currencies_data.push(CurrencyBuilder.new(asset).get_data)
    end
    Currency.create(create_currencies_data)
  end

  def create_history_prices(currencies)
    prices_data = []
    currencies.each do |currency|
      history = Integrations::CoinCap.new.assets_history( currency.coin_cap_currency_id )['data']
      last_history = history.select { |h| to_time(h['time']) >= (7.days + 2.hours).ago }
      last_history.each do |h|
        prices_data.push({
                           price_usd: h['priceUsd'],
                           currency_id: currency.id,
                           timestamp: to_time(h['time'])
                         })
      end
    end
    PriceMovement.create(prices_data)
  end

  def to_time(ms)
    Time.at(ms/1000)
  end


end
