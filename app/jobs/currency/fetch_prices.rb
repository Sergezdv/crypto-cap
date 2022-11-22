require 'sidekiq-scheduler'

class Currency::FetchPrices < ApplicationJob
  def perform
    Currencies::FetchPricesService.new.fetch_and_create
  end
end
