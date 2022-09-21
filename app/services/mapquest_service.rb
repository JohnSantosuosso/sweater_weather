class MapquestService
    class << self
      def call_for_coordinates(location)
        response = connection.get("/geocoding/v1/address?location=#{location}")
        parse_data(response)
      end

      def call_for_road_trip(origin, destination)
        response = connection.get("/directions/v2/route?from=#{origin[:lat]},#{origin[:lng]}&to=#{destination[:lat]},#{destination[:lng]}")
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