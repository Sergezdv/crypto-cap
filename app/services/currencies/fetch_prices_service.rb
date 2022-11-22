# frozen_string_literal: true

module Currencies
  class FetchPricesService
    def initialize(payload = {})
      @assets = payload[:assets]
      @skip_prices = payload[:skip_prices]
      @currencies = Currency.all
    end

    def fetch_and_create
      fetch_assets unless assets
      create_prices unless skip_prices
      update_currencies
    end

    private

    attr_reader :assets, :skip_prices, :currencies

    def fetch_assets
      coin_cap_currency_ids = @currencies.map(&:coin_cap_currency_id)
      @assets = Integrations::CoinCap.new.assets(coin_cap_currency_ids)
    end

    def create_prices
      prices_data = []
      currencies.each do |currency|
        asset = assets['data'].find { |asset| asset['id'] == currency.coin_cap_currency_id }
        prices_data.push({
                           price_usd: asset['priceUsd'],
                           currency_id: currency.id,
                           timestamp: Time.at(assets['timestamp'] / 1000)
                         })
      end
      PriceMovement.create(prices_data)
    end

    def update_currencies
      currencies.each do |currency|
        asset = assets['data'].find { |asset| asset['id'] == currency.coin_cap_currency_id }
        currencies_data = CurrencyBuilder.new(asset, currency).get_data
        currency.update(currencies_data)
      end
    end

    def get_asset(_coin_id)
      assets['data'].find { |asset| asset['id'] == currency.coin_cap_currency_id }
    end
  end
end
