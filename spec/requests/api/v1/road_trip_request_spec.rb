require 'rails_helper'

RSpec.describe "Road Trips", type: :request do
  describe 'get trip, happy path' do
    it 'returns a 200 status code', :vcr do
      user = User.create(email: 'john@gmail.com', password: 'password', password_confirmation: 'password')
      body = { origin: 'Denver,CO', destination: 'Pueblo,CO', api_key: user.auth_token }
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }

      post '/api/v1/road_trip', headers: headers, params: JSON.generate(body)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      
      trip = JSON.parse(response.body, symbolize_names: true)
      expect(trip).to be_a(Hash)
      expect(trip).to have_key(:data)
      expect(trip[:data]).to be_a(Hash)
      expect(trip[:data]).to have_key(:id)
      expect(trip[:data][:id]).to eq(nil)
      expect(trip[:data]).to have_key(:type)
      expect(trip[:data][:type]).to eq('roadtrip')
      expect(trip[:data]).to have_key(:attributes)
      expect(trip[:data][:attributes]).to be_a(Hash)
      expect(trip[:data][:attributes]).to have_key(:start_city)
      expect(trip[:data][:attributes][:start_city]).to be_a(String)
      expect(trip[:data][:attributes]).to have_key(:end_city)
      expect(trip[:data][:attributes][:end_city]).to be_a(String)
      expect(trip[:data][:attributes]).to have_key(:travel_time)
      expect(trip[:data][:attributes][:travel_time]).to be_a(String)
    end
  end

  describe 'get trip, sad path' do
    it 'returns a 404 status code with invalid api key', :vcr do
      user = User.create(email: 'john@gmail.com', password: 'password', password_confirmation: 'password')
      body = { origin: 'Denver,CO', destination: 'Pueblo,CO', api_key: '12345' }
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }

      post '/api/v1/road_trip', headers: headers, params: JSON.generate(body)

      expect(response.status).to eq(404)
      expect(response.body).to eq('Invalid API Key')
    end

    it 'returns a 404 status code with unreachable destination', :vcr do
        user = User.create(email: 'john@gmail.com', password: 'password', password_confirmation: 'password')
        body = { origin: 'Denver,CO', destination: 'Wuhan China', api_key: user.auth_token  }
        headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }

        post '/api/v1/road_trip', headers: headers, params: JSON.generate(body)

        expect(response.status).to eq(404)
        expect(response.body).to eq("We are unable to route with the given locations.")
    end

    it 'returns a 404 status code no origin provided', :vcr do
      user = User.create(email: 'john@gmail.com', password: 'password', password_confirmation: 'password')
      body = { origin: nil, destination: "Aurora, CO", api_key: user.auth_token  }
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }

      post '/api/v1/road_trip', headers: headers, params: JSON.generate(body)
  
      expect(response.status).to eq(404)
      expect(response.body).to eq("Origin cannot be nil.")
    end

    it 'returns a 404 status code no destination provided', :vcr do
      user = User.create(email: 'john@gmail.com', password: 'password', password_confirmation: 'password')
      body = { origin: 'Denver,CO', destination: nil, api_key: user.auth_token  }
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }

      post '/api/v1/road_trip', headers: headers, params: JSON.generate(body)

      expect(response.status).to eq(404)
      expect(response.body).to eq("Destination cannot be nil.")
    end
  end
end
