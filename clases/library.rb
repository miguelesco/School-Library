class Library 
  attr_accessor :list_books
  def initialize()
    @list_books = []
  end

  def add_book(book)
    @list_books << book
  end
end