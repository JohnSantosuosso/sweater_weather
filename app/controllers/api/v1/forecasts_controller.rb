class Api::V1::ForecastsController < ApplicationController
  before_action :get_coordinates

  def index
    @forecast = ForecastFacade.get_forecast(@coordinates)
    render json: ForecastSerializer.new(@forecast)
  end


  private
  def get_coordinates
    if params[:location].present?
      @coordinates = MapquestFacade.get_coordinates(params[:location])
    else
      render 404 # update to render error message
    end
  end


end