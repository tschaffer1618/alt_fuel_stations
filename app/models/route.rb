class Route
  attr_reader :distance,
              :duration,
              :html_instructions
              
  def initialize(route_hash)
    @distance = route_hash["distance"]["text"]
    @duration = route_hash["duration"]["text"]
    @html_instructions = route_hash["html_instructions"]
  end
end
