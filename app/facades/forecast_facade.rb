class ForecastFacade
  class << self
    def get_forecast(coordinates)
      forecast = ForecastService.call_for_forecast(coordinates)
    end
  end
end
