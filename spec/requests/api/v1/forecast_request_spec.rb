require 'rails_helper'

RSpec.describe "Forecasts", type: :request do
  describe 'get forecast, happy path' do
    it 'returns a 200 status code' do
      get '/api/v1/forecast?location=Washington,DC'

      expect(response).to be_successful
      expect(response).to have_http_status(200)
      
    end
  end
end