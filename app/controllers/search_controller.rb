class SearchController < ApplicationController
  def index
    # service = NrelService.new
    # oauth_response = service.get_nearest_station(params[:location])
    nrel_parameters = {
      api_key: ENV['NREL_API_KEY'],
      location: params[:location],
      limit: 1
    }

    nrel_oauth_response = Faraday.get('https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json', nrel_parameters)
    nrel_json_response = JSON.parse(nrel_oauth_response.body)
    json_station = nrel_json_response["fuel_stations"].first
    @station = Station.new(json_station)

    google_parameters = {
      key: ENV['GOOGLE_API_KEY'],
      origin: params[:location],
      destination: "#{@station.street_address}+#{@station.city}+#{@station.state}"
    }

    google_oauth_response = Faraday.get('https://maps.googleapis.com/maps/api/directions/json', google_parameters)
    google_json_response =  JSON.parse(google_oauth_response.body)
    json_route = google_json_response["routes"].first["legs"].first["steps"].first
    @route = Route.new(json_route)  
  end
end
