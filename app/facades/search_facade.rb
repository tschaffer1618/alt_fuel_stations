class SearchFacade
  def initialize
    @nrel_service = NrelService.new
    @google_service = GoogleService.new
  end

  def create_station(location)
    nrel_json_response = @nrel_service.get_nearest_station(location)
    json_station = nrel_json_response["fuel_stations"].first
    Station.new(json_station)
  end

  def create_route(origin, destination)
    google_json_response = @google_service.get_route(origin, destination)
    json_route = google_json_response["routes"].first["legs"].first["steps"].first
    Route.new(json_route)
  end



end
