module CurrenciesHelper
  def diff_class(diff)
    diff.to_f > 0 ? 'text-success' : 'text-danger'
  end
end
