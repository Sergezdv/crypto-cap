# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

coin_cap_currency_ids = %w[bitcoin ethereum tether usd-coin binance-coin]
Currencies::FetchHistoryPricesService.new(coin_cap_currency_ids).fetch_history_and_create
