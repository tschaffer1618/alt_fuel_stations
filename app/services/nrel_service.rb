# class NrelService
#   def get_nearest_station(location)
#     conn.get('nearest/json', params: {limit: 1, location: location})
#   private
#
#   def conn
#     key = ENV['NREL_API_KEY']
#     Faraday.new('https://developer.nrel.gov/api/alt-fuel-stations/v1', params: {api_key: key})
#   end
# end
