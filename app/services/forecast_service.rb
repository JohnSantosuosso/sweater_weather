class ForecastService
  class << self
    def call_for_forecast(coordinates)
      lat = coordinates[:lat]
      lng = coordinates[:lng]
      response = connection.get("/data/2.5/weather?lat=#{lat}&lon=#{lng}")
      parse_data(response)
    end

  private
    def connection
      Faraday.new(url: "https://api.openweathermap.org") do |faraday|
        faraday.params["appid"] = ENV['weather_key']
      end
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end