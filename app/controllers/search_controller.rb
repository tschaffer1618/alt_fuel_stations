class SearchController < ApplicationController
  def index
    parameters = {
      api_key: ENV['NREL_API_KEY'],
      location: params[:location],
      limit: 1
    }

    oauth_response = Faraday.get('https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json', parameters)
  end
end
