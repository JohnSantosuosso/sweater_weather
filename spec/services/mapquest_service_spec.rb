require 'rails_helper'

RSpec.describe MapquestService do
  describe 'class methods' do
    describe '.call_for_coordinates, happy path' do
      it 'returns a hash of coordinates', :vcr do
        response = MapquestService.call_for_coordinates('Washington, DC')

        expect(response).to be_a(Hash)
        expect(response[:results][0][:locations][0][:latLng]).to have_key(:lat)
        expect(response[:results][0][:locations][0][:latLng]).to have_key(:lng)
      end
    end
    
    describe '.call_for_coordinates, sad path' do
      it 'returns a hash of coordinates', :vcr do
        response = MapquestService.call_for_coordinates('')
        
        expect(response).to be_a(Hash)
        expect(response[:info][:statuscode]).to eq(400)
      end
    end
  end
end
