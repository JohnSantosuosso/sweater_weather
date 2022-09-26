class BookService
  class << self
    def call_for_books(location, quantity)
      response = connection.get("/search.json?title=#{location}&limit=#{quantity}")
      parse_data(response)
    end

  private
    def connection
      Faraday.new(url: "http://openlibrary.org") do |faraday|
        faraday
      end
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end