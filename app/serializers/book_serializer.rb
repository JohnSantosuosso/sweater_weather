class BookSerializer
  class << self
    def new(books, forecast, location)
      {
        data: {
          id: nil,
          type: 'books',
          attributes: {
            destination: location,
            forecast: {
              summary: forecast[:current][:weather].first[:description],
              temperature: kelvin_to_farenheit_formatter(forecast[:current][:temp])
            },
            total_books_found: books[:numFound],
            books: [
              book_info(books) 
            ]
          }
        }
      }
    end

    def book_info(books)
      books[:docs].map do |book|
        {
          isbn: book[:isbn] || 'no isbn data available',
          title: book[:title],
          publisher: book[:publisher]
        }
      end
    end

    def kelvin_to_farenheit_formatter(temp)
      ((temp * 9/5)-459.67).round(2)
    end
  end
end