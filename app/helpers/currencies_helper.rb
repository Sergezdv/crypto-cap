# frozen_string_literal: true

module CurrenciesHelper
  def diff_class(diff)
    diff.to_f.positive? ? 'text-success' : 'text-danger'
  end
end
