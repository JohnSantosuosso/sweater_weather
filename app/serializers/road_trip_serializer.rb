class RoadTripSerializer
  class << self
    def new(trip_data)
      require 'pry'; binding.pry 
      {
        data: {
          id: nil,
          type: 'roadtrip',
          attributes: {
            start_city: format_starting_location(trip_data),
            end_city: format_ending_location(trip_data),
            travel_time: format_travel_time(trip_data)
          }
        }
      }
    end

    def format_starting_location(trip_data)
     format_starting_city(trip_data) + ', ' + format_starting_state(trip_data)
    end

    def format_starting_city(trip_data)
      start_city = trip_data[:route][:locations].first[:adminArea5]
    end

    def format_starting_state(trip_data)
      start_state = trip_data[:route][:locations].first[:adminArea3]
    end

    def format_ending_location(trip_data)
      format_ending_city(trip_data) + ', ' + format_ending_state(trip_data)
    end

    def format_ending_city(trip_data)
      end_city = trip_data[:route][:locations].last[:adminArea5]
    end

    def format_ending_state(trip_data)
      end_state = trip_data[:route][:locations].last[:adminArea3]
    end

    def format_travel_time(trip_data)
      hour_format(trip_data) + minute_format(trip_data)
    end

    def hour_format(trip_data)
      hours = trip_data[:route][:formattedTime].slice(0..1).to_i
      "#{hours} hours, " if hours > 0
    end

    def minute_format(trip_data)
      minutes = trip_data[:route][:formattedTime].slice(3..4).to_i
      "#{minutes} minutes"
    end

  end
end