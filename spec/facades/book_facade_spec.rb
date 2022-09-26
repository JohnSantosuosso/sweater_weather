require 'rails_helper'

RSpec.describe BookFacade do
  it 'can get book data, happy path', :vcr do
    location = 'denver,co'
    quantity = 5
    books = BookFacade.get_books(location, quantity)

    expect(books).to be_a(Hash)
    expect(books[:numFound]).to be_a(Integer)
    expect(books[:docs].count).to eq(5)
    expect(books[:docs].last).to have_key(:isbn)
    expect(books[:docs].last[:isbn]).to be_a(Array)
    expect(books[:docs].last).to have_key(:title)
    expect(books[:docs].last[:title]).to be_a(String)
    expect(books[:docs].last).to have_key(:publisher)
    expect(books[:docs].last[:publisher]).to be_a(Array)
  end

  it 'can get book data, sad path, quantity less than 1 provided', :vcr do
    location = 'denver,co'
    quantity = 0

    books = BookFacade.get_books(location, quantity)

    expect(books).to be_a(Hash)
    expect(books[:q]).to eql("")
    expect(books[:docs]).to eql([])
  end
end