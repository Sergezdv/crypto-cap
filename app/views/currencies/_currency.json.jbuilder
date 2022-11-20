json.extract! currency, :id, :coin_cap_currency_id, :name, :market_cap_usd, :change_percent_1hr, :change_percent_24hr, :change_percent_7d, :created_at, :updated_at
json.url currency_url(currency, format: :json)
