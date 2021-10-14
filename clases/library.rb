class Library 
  attr_accessor :list_books
  def initialize()
    @list_books = []
  end

  def add_book(book)
    @list_books << book
  end

  def add_rental(rental)
    @list_books.each do |book|
      if book.title == rental.book.title
        book.rental = rental
      end
    end
  end
end