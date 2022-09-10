class ForecastService
  class << self
    def call_for_forecast(coordinates)
      response = connection.get("/geocoding/v1/address?query=#{coordinates}")
      parse_data(response)
    end

  private
    def connection
      Faraday.new(url: "http://www.mapquestapi.com") do |faraday|
        faraday.params["key"] = ENV['coordinates_key']
      end
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end