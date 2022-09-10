class Api::V1::ForecastsController < ApplicationController
  before_action :get_coordinates

  def index
    @forecast = ForecastFacade.get_forecast(@coordinates)
  end


  private
  def get_coordinates
    require 'pry'; binding.pry 
    if params[:location].present?
      @coordinates = MapquestService.call_for_coordinates(params[:location])
    else
      render 404 # update to render error message
    end
  end


end