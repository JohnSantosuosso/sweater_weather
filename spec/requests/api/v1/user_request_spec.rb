require 'rails_helper'

RSpec.describe "User Registation", type: :request do
  describe 'expose user registration endpoint, happy path' do
    it 'returns a 201 status code', :vcr do
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      user_data = { "email": "john@gmail.com", "password": "password123", "password_confirmation": "password123" }
      post '/api/v1/users', headers: headers, params: JSON.generate(user_data)

      expect(response).to be_successful
      expect(response.status).to eq(201)
    end
  end
end