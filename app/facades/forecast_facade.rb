class ForecastFacade
  class << self
    def get_forecast(coordinates)
      forecast = ForecastService.call_for_forecast(coordinates)
      require 'pry'; binding.pry 
    end
  end
end
