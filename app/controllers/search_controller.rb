class SearchController < ApplicationController
  def index
    # service = NrelService.new
    # oauth_response = service.get_nearest_station(params[:location])
    parameters = {
      api_key: ENV['NREL_API_KEY'],
      location: params[:location],
      limit: 1
    }

    oauth_response = Faraday.get('https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json', parameters)
    json_response = JSON.pars(oauth_response.body)
    json_station = json_response["fuel_stations"].first
    @station = Station.new(json_station)
  end
end
