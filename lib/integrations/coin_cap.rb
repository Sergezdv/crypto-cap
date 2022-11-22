require 'net/http'

class Integrations::CoinCap
  class ApiError < StandardError; end

  def assets(asset_ids) # bitcoin,ethereum
    asset_ids = asset_ids.join(',') if asset_ids.is_a?(Array)
    request('assets', ids: asset_ids.to_s) # => { data: [], timestamp: 123 }
  end

  def assets_history(asset_id) # bitcoin
    request("assets/#{asset_id}/history", interval: 'h1') # => { data: [], timestamp: 123 }
  end

  private

  def request(path, params)
    uri = URI("https://api.coincap.io/v2/#{path}")
    uri.query = URI.encode_www_form(params)
    response = JSON.parse(Net::HTTP.get_response(uri).body)
  rescue JSON::JSONError => e
    Rails.logger.info "Exception: CoinCap request url #{url} raise: #{e.message}"
    raise ApiError, e
  else
    response
  end
end
