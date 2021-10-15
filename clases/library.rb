class Library
  attr_accessor :list_books, :rentals

  def initialize()
    @list_books = []
    @rentals = []
  end

  def add_book(book)
    @list_books << book
  end

  def add_rental(rental)
    @rentals << rental
  end
end
