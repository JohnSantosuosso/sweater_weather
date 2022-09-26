class Api::V1::BooksController < ApplicationController
  before_action :get_coordinates, :params_quantity_check

  def index
    @books = BookFacade.get_books(params[:location], params[:quantity])
    @forecast = ForecastFacade.get_forecast(@coordinates)
    render json: BookSerializer.new(@books, @forecast, params[:location])
  end


  private
  def get_coordinates
    if !params[:location].nil?
      @coordinates = MapquestFacade.get_coordinates(params[:location])
    else
      render json: "Location cannot be nil.", status: 404
    end
  end

  def params_quantity_check
    if params[:quantity].nil? || params[:quantity].to_i < 1
      render json: "Quantity cannot be nil or less than 1.", status: 404
    end
  end

end