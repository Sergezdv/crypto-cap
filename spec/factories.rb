FactoryBot.define do
  factory :currency do
    coin_cap_currency_id { "MyString" }
    name { "MyString" }
    market_cap_usd { "9.99" }
    change_percent_1hr { "MyString" }
    change_percent_24hr { "MyString" }
    change_percent_7d { "MyString" }
  end

  factory :price_movement do
    price_usd { "9.99" }
  end

  factory(:user) do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end