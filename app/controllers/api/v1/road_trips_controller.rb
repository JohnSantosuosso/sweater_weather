class Api::V1::RoadTripsController < ApplicationController
  before_action :starting_point, :ending_point

  def create
    @road_trip = MapquestFacade.get_road_trip(@origin, @destination)
    @weather = ForecastFacade.get_forecast(@destination)
    render json: RoadTripSerializer.new(@road_trip, @weather)
  end

  private
  def starting_point
    if !params[:origin].nil?
      @origin = MapquestFacade.get_coordinates(params[:origin])
    else
      render status: 404 # update to render error message
    end
  end

  def ending_point
    if !params[:destination].nil?
      @destination = MapquestFacade.get_coordinates(params[:destination])
    else
      render status: 404 # update to render error message
    end
  end

end