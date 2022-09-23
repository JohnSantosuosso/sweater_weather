class Api::V1::RoadTripsController < ApplicationController
  before_action :starting_point, :ending_point, :api_key_check

  def create
    @road_trip = MapquestFacade.get_road_trip(@origin, @destination)
    if @road_trip[:info][:statuscode] == 402
      render json: @road_trip[:info][:messages].first, status: 404
    else
      @weather = ForecastFacade.get_forecast(@destination)
      render json: RoadTripSerializer.new(@road_trip, @weather)
    end
  end

  private
  def starting_point
    if !params[:origin].nil?
      @origin = MapquestFacade.get_coordinates(params[:origin])
    else
      render json: "Origin cannot be nil.", status: 404
    end
  end

  def ending_point
    if !params[:destination].nil?
      @destination = MapquestFacade.get_coordinates(params[:destination])
    else
      render json: "Destination cannot be nil.", status: 404
    end
  end

  def api_key_check
    @user = User.find_by(auth_token: params[:api_key])
    if !@user.nil?
      @user
    else
      render json: "Invalid API Key", status: 404
    end
  end

end