class CurrenciesController < ApplicationController
  before_action :set_currency, only: %i[ show ]

  # GET /currencies or /currencies.json
  def index
    @currencies = Currency.all
  end

  # GET /currencies/1 or /currencies/1.json
  def show
    @price_movements = @currency.price_movements.order(timestamp: :desc).limit(24)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_currency
      @currency = Currency.find(params[:id])
    end
end
