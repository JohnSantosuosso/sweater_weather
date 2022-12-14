require 'rails_helper'

RSpec.describe MapquestFacade do
  describe 'class methods' do
    describe '::get_coordinates', :vcr do
      it 'returns coordinates for a given location, happy path' do
        location = 'Washington, DC'
        results = MapquestFacade.get_coordinates(location)

        expect(results).to be_a(Hash)
        expect(results).to have_key(:lat)
        expect(results[:lat]).to be_a(Float)
        expect(results).to have_key(:lng)
        expect(results[:lng]).to be_a(Float)
      end
    end
  end
end