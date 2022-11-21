FactoryBot.define do
  factory :price_movement do
    price_usd { "9.99" }
    currency_id { 1 }
    timestamp { "2022-11-21 02:29:34" }
  end

  factory :currency do
    coin_cap_currency_id { "MyString" }
    name { "MyString" }
    market_cap_usd { "9.99" }
    change_percent_1hr { "MyString" }
    change_percent_24hr { "MyString" }
    change_percent_7d { "MyString" }
  end

  factory(:user) do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end