require 'rails_helper'

RSpec.describe 'currencies/show', type: :view do
  before(:each) do
    @currency = assign(:currency, Currency.create!(
                                    coin_cap_currency_id: 'Coin Cap Currency',
                                    name: 'Name',
                                    market_cap_usd: '9.99',
                                    change_percent_1hr: 'Change Percent 1hr',
                                    change_percent_24hr: 'Change Percent 24hr',
                                    change_percent_7d: 'Change Percent 7d'
                                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Coin Cap Currency/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Change Percent 1hr/)
    expect(rendered).to match(/Change Percent 24hr/)
    expect(rendered).to match(/Change Percent 7d/)
  end
end
