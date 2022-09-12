class MapquestFacade
  class << self
    def get_coordinates(location)
      coordinates = MapquestService.call_for_coordinates(location)[:results].first[:locations].first[:latLng]
    end

    def get_road_trip(origin, destination)
      road_trip = MapquestService.call_for_road_trip(origin, destination)
    end
  end
end
