class Station
  attr_reader :station_name,
              :street_address,
              :city,
              :state,
              :zip,
              :access_days_time,
              :latitude,
              :longitude,
              :distance,
              :fuel_type_code

  def initialize(station_hash)
    @station_name = station_hash["station_name"]
    @street_address = station_hash["street_address"]
    @city = station_hash["city"]
    @state = station_hash["state"]
    @zip = station_hash["zip"]
    @access_days_time = station_hash["access_days_time"]
    @latitude = station_hash["latitude"]
    @longitude = station_hash["longitude"]
    @distance = station_hash["distance"]
    @fuel_type_code = station_hash["fuel_type_code"]
  end
end
