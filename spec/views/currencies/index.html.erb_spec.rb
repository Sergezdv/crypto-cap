# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'currencies/index', type: :view do
  before(:each) do
    assign(:currencies, [
             Currency.create!(
               coin_cap_currency_id: 'Coin Cap Currency',
               name: 'Name',
               market_cap_usd: '9.99',
               change_percent_1hr: 'Change Percent 1hr',
               change_percent_24hr: 'Change Percent 24hr',
               change_percent_7d: 'Change Percent 7d'
             ),
             Currency.create!(
               coin_cap_currency_id: 'Coin Cap Currency',
               name: 'Name',
               market_cap_usd: '9.99',
               change_percent_1hr: 'Change Percent 1hr',
               change_percent_24hr: 'Change Percent 24hr',
               change_percent_7d: 'Change Percent 7d'
             )
           ])
  end

  it 'renders a list of currencies' do
    render
    assert_select 'tr>td', text: 'Coin Cap Currency'.to_s, count: 2
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: 'Change Percent 1hr'.to_s, count: 2
    assert_select 'tr>td', text: 'Change Percent 24hr'.to_s, count: 2
    assert_select 'tr>td', text: 'Change Percent 7d'.to_s, count: 2
  end
end
