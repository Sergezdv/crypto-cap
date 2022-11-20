# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


currencies = %w(bitcoin ethereum tether usd-coin binance-coin)
currencies.each { |coin_cap_currency_id| Currency.find_or_create_by(coin_cap_currency_id: coin_cap_currency_id) }
