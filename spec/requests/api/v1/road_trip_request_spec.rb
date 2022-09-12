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
      require 'pry'; binding.pry 
    end
  end
end
