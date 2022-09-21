class RoadTripSerializer
  class << self
    def new(trip_data, forecast_data)
      require 'pry'; binding.pry 
      {
        data: {
          id: nil,
          type: 'roadtrip',
          attributes: {
            start_city: format_starting_location(trip_data),
            end_city: format_ending_location(trip_data),
            travel_time: format_travel_time(trip_data),
            weather_at_eta: {
              temperature: format_weather_at_eta(forecast_data, trip_data)[:temperature],
              conditions: format_weather_at_eta(forecast_data, trip_data)[:conditions]
            }
          }
        }
      }
    end

    #add to module everything below
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

    def format_total_time(trip_data)
      trip_time_to_milliseconds = trip_data[:route][:realTime]
      Time.now.to_i + trip_time_to_milliseconds
    end

    def total_time_hourly_threshold_check(forecast_data, trip_data)
      if !hourly_check(forecast_data, trip_data).nil?
        hourly_check(forecast_data, trip_data)
      else
        run_daily_check(forecast_data, trip_data)
      end
    end

    def daily_check(forecast_data, trip_data)
      if !daily_check(forecast_data, trip_data).nil?
        daily_check(forecast_data, trip_data)
      else
        nil
      end
    end

    def hourly_check(forecast_data, trip_data)
      forecast_data[:hourly].bsearch do |hour|
        hour[:dt] >= format_total_time(trip_data)
      end
    end

    def daily_check(forecast_data)
      forecast_data[:daily][1..7].bsearch do |day|
        day[:dt] >= format_total_time(trip_data)
      end
    end

    def format_weather_at_eta(forecast_data, trip_data)
      future_forecast = total_time_hourly_threshold_check(forecast_data, trip_data)
      future_forecast = { temperature: kelvin_to_farenheit_formatter(future_forecast[:temp]), conditions: future_forecast[:weather].first[:description] }
      future_forecast
    end

    def kelvin_to_farenheit_formatter(temp)
      ((temp * 9/5)-459.67).round(2)
    end

  end
end