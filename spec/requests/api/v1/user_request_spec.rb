require 'rails_helper'

RSpec.describe "User Registation", type: :request do
  describe 'expose user registration endpoint, happy path' do
    it 'returns a 201 status code', :vcr do
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      user_data = { "email": "john@gmail.com", "password": "password123", "password_confirmation": "password123" }
      post '/api/v1/users', headers: headers, params: JSON.generate(user_data)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user).to have_key(:data)
      expect(user[:data]).to have_key(:id)
      expect(user[:data][:id]).to be_a(Integer)
      expect(user[:data]).to have_key(:type)
      expect(user[:data][:type]).to be_a(String)
      expect(user[:data]).to have_key(:attributes)
      expect(user[:data][:attributes]).to have_key(:email)
      expect(user[:data][:attributes][:email]).to be_a(String)
      expect(user[:data][:attributes]).to have_key(:api_key)
      expect(user[:data][:attributes][:api_key]).to be_a(String)
    end
  end

  describe 'expose user registration endpoint, sad path' do
    it 'returns a 400 status code', :vcr do
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      user_data = { "email": "john@gmail.com", "password": "password123", "password_confirmation": "assword123" }
      post '/api/v1/users', headers: headers, params: JSON.generate(user_data)


      expect(response.status).to eq(400)
    end
  end
end