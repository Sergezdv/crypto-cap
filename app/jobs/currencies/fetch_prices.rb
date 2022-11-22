# frozen_string_literal: true

require 'sidekiq-scheduler'

module Currencies
  class FetchPrices < ApplicationJob
    def perform
      # Currencies::FetchPricesService.new.fetch_and_create
    end
  end
end
