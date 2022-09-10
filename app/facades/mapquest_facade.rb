class MapquestFacade
  class << self
    def get_coordinates(location)
      coordinates = MapquestService.call_for_coordinates(location)[:results].first[:locations].first[:latLng]
    end
  end
end
