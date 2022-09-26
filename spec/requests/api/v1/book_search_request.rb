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

      results = JSON.parse(response.body, symbolize_names: true)

      expect(results).to be_a(Hash)
      expect(results).to have_key(:data)
      expect(results[:data]).to be_a(Hash)
      expect(results[:data]).to have_key(:id)
      expect(results[:data][:id]).to be_nil
      expect(results[:data]).to have_key(:type)
      expect(results[:data][:type]).to eq('books')
      expect(results[:data]).to have_key(:attributes)
      expect(results[:data][:attributes]).to be_a(Hash)
      expect(results[:data][:attributes]).to have_key(:destination)
      expect(results[:data][:attributes][:destination]).to be_a(String)
      expect(results[:data][:attributes]).to have_key(:forecast)
      expect(results[:data][:attributes][:forecast]).to be_a(Hash)
      expect(results[:data][:attributes][:forecast]).to have_key(:summary)
      expect(results[:data][:attributes][:forecast][:summary]).to be_a(String)
      expect(results[:data][:attributes][:forecast]).to have_key(:temperature)
      expect(results[:data][:attributes][:forecast][:temperature]).to be_a(Float)
      expect(results[:data][:attributes]).to have_key(:total_books_found)
      expect(results[:data][:attributes][:total_books_found]).to be_a(Integer)
      expect(results[:data][:attributes]).to have_key(:books)
      expect(results[:data][:attributes][:books]).to be_an(Array)
      expect(results[:data][:attributes][:books].count).to eq(5)
      expect(results[:data][:attributes][:books].first).to have_key(:isbn)
      expect(results[:data][:attributes][:books].first[:isbn]).to be_a(Array)
      expect(results[:data][:attributes][:books].first).to have_key(:title)
      expect(results[:data][:attributes][:books].first[:title]).to be_a(String)
      expect(results[:data][:attributes][:books].first).to have_key(:publisher)
      expect(results[:data][:attributes][:books].first[:publisher]).to be_a(Array)
    end
  end

  describe 'get trip, sad path, no isbn' do
    it 'returns a 200 status code', :vcr do
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      get '/api/v1/book-search', headers: headers, params: { location: "denver, co", quantity: 5 }

      expect(response).to be_successful
      expect(response).to have_http_status(200)

      results = JSON.parse(response.body, symbolize_names: true)

      expect(results[:data][:attributes][:books].first).to have_key(:isbn)
      expect(results[:data][:attributes][:books].first[:isbn]).to eq('no isbn data available')
    end
  end

end