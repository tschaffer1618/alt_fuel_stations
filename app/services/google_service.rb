class GoogleService
  def get_route(origin, destination)
    response = conn.get('json', origin: origin, destination: destination)
    JSON.parse(response.body)
  end

  private

  def conn
    key = ENV['GOOGLE_API_KEY']
    Faraday.new('https://maps.googleapis.com/maps/api/directions', params: {key: key})
  end
end
