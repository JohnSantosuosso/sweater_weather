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
              temperature: forecast[:current][:temp] #convert to farenheit
            },
            total_books_found: books[:numFound],
            books: [
              book_info(books) 
            ]
          }
        }
      }
      require 'pry'; binding.pry 
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
  end
end