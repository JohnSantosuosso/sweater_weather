require 'rails_helper'

RSpec.describe "Forecasts", type: :request do
  describe 'get forecast, happy path' do
    it 'returns a 200 status code' do
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      get '/api/v1/forecast', headers: headers, params: { location: "Washington, DC" }

      expect(response).to be_successful
      expect(response).to have_http_status(200)

      forecast = JSON.parse(response.body, symbolize_names: true)

      expect(forecast).to be_a(Hash)
      expect(forecast).to have_key(:data)
      expect(forecast[:data]).to be_a(Hash)
      expect(forecast[:data]).to have_key(:id)
      expect(forecast[:data][:id]).to eq(nil)
      expect(forecast[:data]).to have_key(:type)
      expect(forecast[:data][:type]).to eq('forecast')
      expect(forecast[:data]).to have_key(:attributes)
      expect(forecast[:data][:attributes]).to be_a(Hash)
      expect(forecast[:data][:attributes]).to have_key(:current_weather)
      expect(forecast[:data][:attributes][:current_weather]).to be_a(Hash)
      expect(forecast[:data][:attributes]).to have_key(:daily_weather)
      expect(forecast[:data][:attributes][:daily_weather]).to be_an(Array)
      expect(forecast[:data][:attributes]).to have_key(:hourly_weather)
      expect(forecast[:data][:attributes][:hourly_weather]).to be_an(Array)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:datetime)
      expect(forecast[:data][:attributes][:current_weather][:datetime]).to be_a(String)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:sunrise)
      expect(forecast[:data][:attributes][:current_weather][:sunrise]).to be_a(String)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:sunset)
      expect(forecast[:data][:attributes][:current_weather][:sunset]).to be_a(String)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:temperature)
      expect(forecast[:data][:attributes][:current_weather][:temperature]).to be_a(Float)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:feels_like)
      expect(forecast[:data][:attributes][:current_weather][:feels_like]).to be_a(Float)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:humidity)
      expect(forecast[:data][:attributes][:current_weather][:humidity]).to be_an(Integer)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:uvi)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:visibility)
      expect(forecast[:data][:attributes][:current_weather][:visibility]).to be_an(Integer)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:conditions)
      expect(forecast[:data][:attributes][:current_weather][:conditions]).to be_a(String)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:icon)
      expect(forecast[:data][:attributes][:current_weather][:icon]).to be_a(String)
      expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:date)
      expect(forecast[:data][:attributes][:daily_weather].first[:date]).to be_a(String)
      expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:sunrise)
      expect(forecast[:data][:attributes][:daily_weather].first[:sunrise]).to be_a(String)
      expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:sunset)
      expect(forecast[:data][:attributes][:daily_weather].first[:sunset]).to be_a(String)
      expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:max_temp)
      expect(forecast[:data][:attributes][:daily_weather].first[:max_temp]).to be_a(Float)
      expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:min_temp)
      expect(forecast[:data][:attributes][:daily_weather].first[:min_temp]).to be_a(Float)
      expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:conditions)
      expect(forecast[:data][:attributes][:daily_weather].first[:conditions]).to be_a(String)
      expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:icon)
      expect(forecast[:data][:attributes][:daily_weather].first[:icon]).to be_a(String)
      expect(forecast[:data][:attributes][:hourly_weather].first).to have_key(:time)
      expect(forecast[:data][:attributes][:hourly_weather].first[:time]).to be_a(String)
      expect(forecast[:data][:attributes][:hourly_weather].first).to have_key(:temperature)
      expect(forecast[:data][:attributes][:hourly_weather].first[:temperature]).to be_a(Float)
      expect(forecast[:data][:attributes][:hourly_weather].first).to have_key(:conditions)
      expect(forecast[:data][:attributes][:hourly_weather].first[:conditions]).to be_a(String)
      expect(forecast[:data][:attributes][:hourly_weather].first).to have_key(:icon)
      expect(forecast[:data][:attributes][:hourly_weather].first[:icon]).to be_a(String)


      expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:dew_point)
      expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:clouds)
      expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:wind_speed)
      expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:wind_deg)
      expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:wind_gust)
      expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:pressure)
      expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:pop)
      expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:rain)
      expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:snow)
      expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:moonrise)
      expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:moonset)
      expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:moon_phase)
      expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:feels_like)
      expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:pressure)
      expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:humidity)
      expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:dew_point)
      expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:wind_speed)
      expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:wind_deg)
      expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:wind_gust)
      expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:clouds)
      expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:pop)
      expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:rain)
      expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:snow)
      expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:uvi)
      expect(forecast[:data][:attributes][:hourly_weather].first).to_not have_key(:feels_like)
      expect(forecast[:data][:attributes][:hourly_weather].first).to_not have_key(:pressure)
      expect(forecast[:data][:attributes][:hourly_weather].first).to_not have_key(:humidity)
      expect(forecast[:data][:attributes][:hourly_weather].first).to_not have_key(:dew_point)
      expect(forecast[:data][:attributes][:hourly_weather].first).to_not have_key(:clouds)
      expect(forecast[:data][:attributes][:hourly_weather].first).to_not have_key(:visibility)
      expect(forecast[:data][:attributes][:hourly_weather].first).to_not have_key(:wind_speed)
      expect(forecast[:data][:attributes][:hourly_weather].first).to_not have_key(:wind_deg)
      expect(forecast[:data][:attributes][:hourly_weather].first).to_not have_key(:wind_gust)
      expect(forecast[:data][:attributes][:hourly_weather].first).to_not have_key(:pop)
      expect(forecast[:data][:attributes][:hourly_weather].first).to_not have_key(:rain)
      expect(forecast[:data][:attributes][:hourly_weather].first).to_not have_key(:snow)
    end
  end

  describe 'get forecast, sad path' do
    it 'returns a 404 status code' do
    get '/api/v1/forecast'

    #expect(response).to_not be_successful
    expect(response.status).to eq(404)
    end
  end
end