class ForecastSerializer
  class << self
    def new(forecast)
      {
        data: {
          id: nil,
          type: 'forecast',
          attributes: {
            current_weather: current_weather(forecast),
            daily_weather: daily_weather(forecast),
            hourly_weather: hourly_weather(forecast)
          }
        }
      }
    end

      def current_weather(forecast)
        {
          datetime: Time.now.strftime('%Y-%m-%d %H:%M:%S %z'),
          sunrise: time_formatter(forecast[:current][:sunrise]),
          sunset: time_formatter(forecast[:current][:sunset]),
          temperature: kelvin_to_farenheit_formatter(forecast[:current][:temp]),
          feels_like: kelvin_to_farenheit_formatter(forecast[:current][:feels_like]),
          uvi: forecast[:current][:uvi],
          humidity: forecast[:current][:humidity],
          visibility: forecast[:current][:visibility],
          conditions: forecast[:current][:weather].first[:description],
          icon: forecast[:current][:weather].first[:icon]
        }
      end

      def daily_weather(forecast)
        forecast[:daily][0..4].map do |day|
          {
            date: time_formatter(day[:dt]),
            sunrise: time_formatter(day[:sunrise]),
            sunset: time_formatter(day[:sunset]),
            max_temp: kelvin_to_farenheit_formatter(day[:temp][:max]),
            min_temp: kelvin_to_farenheit_formatter(day[:temp][:min]),
            conditions: day[:weather].first[:description],
            icon: day[:weather].first[:icon]
          }
        end
      end

      def hourly_weather(forecast)
        forecast[:hourly][0..7].map do |hour|
          {
            time: time_formatter(hour[:dt]),
            temperature: kelvin_to_farenheit_formatter(hour[:temp]),
            conditions: hour[:weather].first[:description],
            icon: hour[:weather].first[:icon]
          }
        end
      end

      def kelvin_to_farenheit_formatter(temp)
        ((temp * 9/5)-459.67).round(2)
      end

      def time_formatter(time)
        Time.at(time).strftime('%Y-%m-%d %H:%M:%S %z')
      end
  end
end