class SearchController < ApplicationController
  def index
    facade = SearchFacade.new
    @station = facade.create_station(params[:location])
    @route =  facade.create_route(params[:location], "#{@station.street_address}+#{@station.city}+#{@station.state}")
  end
end
