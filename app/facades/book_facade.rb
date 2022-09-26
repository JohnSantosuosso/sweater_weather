class BookFacade
  class << self
    def get_books(location, quantity)
      book = BookService.call_for_books(location, quantity)
    end
  end
end