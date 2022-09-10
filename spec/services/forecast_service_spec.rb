require 'rails_helper'

RSpec.describe ForecastService do
  it 'can get forecast data' do
    coordinates = {lat: 39.738453, lng: -104.984853}
    forecast = ForecastService.call_for_forecast(coordinates)
    require 'pry'; binding.pry 

    expect(forecast).to be_a(Hash)
    expect(forecast).to have_key(:weather)
    expect(forecast[:weather]).to be_an(Array)
    expect(forecast[:weather].first).to have_key(:description)
    expect(forecast[:weather].first[:description]).to be_a(String)
    expect(forecast).to have_key(:main)
    expect(forecast[:main]).to be_a(Hash)
    expect(forecast[:main]).to have_key(:temp)
    expect(forecast[:main][:temp]).to be_a(Float)
    expect(forecast[:main]).to have_key(:feels_like)
    expect(forecast[:main][:feels_like]).to be_a(Float)
    expect(forecast[:main]).to have_key(:temp_min)
    expect(forecast[:main][:temp_min]).to be_a(Float)
    expect(forecast[:main]).to have_key(:temp_max)
    expect(forecast[:main][:temp_max]).to be_a(Float)
    expect(forecast[:main]).to have_key(:humidity)
    expect(forecast[:main][:humidity]).to be_a(Numeric)
    expect(forecast).to have_key(:wind)
    expect(forecast[:wind]).to be_a(Hash)
    expect(forecast[:wind]).to have_key(:speed)
    expect(forecast[:wind][:speed]).to be_a(Float)
    expect(forecast[:wind]).to have_key(:deg)
    expect(forecast[:wind][:deg]).to be_a(Numeric)
    expect(forecast).to have_key(:visibility)
    expect(forecast[:visibility]).to be_a(Numeric)
    expect(forecast).to have_key(:dt)
    expect(forecast[:dt]).to be_a(Numeric)
    expect(forecast).to have_key(:name)
    expect(forecast[:name]).to be_a(String)
  end
end
  
