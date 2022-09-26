require 'rails_helper'

RSpec.describe BookFacade do
  it 'can get book data, happy path', :vcr do
    location = 'denver,co'
    quantity = 5
    books = BookFacade.get_books(location, quantity)

    expect(books).to be_a(Hash)
    expect(books[:numFound]).to be_a(Integer)
    expect(books[:docs].count).to eq(5)
    expect(books[:docs].first).to have_key(:isbn)
    expect(books[:docs].first[:isbn]).to be_a(Array)
    expect(books[:docs].first).to have_key(:title)
    expect(books[:docs].first[:title]).to be_a(String)
    expect(books[:docs].first).to have_key(:publisher)
    expect(books[:docs].first[:publisher]).to be_a(Array)
  end
end