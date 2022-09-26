require 'rails_helper'

RSpec.describe "Book Searches", type: :request do
  describe 'get trip, happy path' do
    it 'returns a 200 status code', :vcr do
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      get '/api/v1/book-search', headers: headers, params: { location: "Washington, DC", quantity: 5 }

      expect(response).to be_successful
      expect(response).to have_http_status(200)

      expect(response).to be_successful
      expect(response.status).to eq(200)
    end
  end
end