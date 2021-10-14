require_relative 'clases/student'
require_relative 'clases/teacher'
require_relative 'clases/book'
require_relative 'clases/library'


module SpecialFuntions
  def create_a_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    input = gets.chomp.to_i
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    if input == 1
      print "Has parent permission? [Y/N]: "
      has_parent_permission = gets.chomp.upcase == 'Y'
      student = Student.new(age, name, parent_permission: has_parent_permission)
      puts 'Person created successfully'

    elsif input == 2
      print 'Specialization: ' 
      specialization = gets.chomp
      teacher = Teacher.new(specialization, age, name)
      puts 'Person created successfully'

    else 
      puts 'Invalid input'
    end
    finish_program()
  end

  def create_a_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    library.add_book(book)
    puts 'Book created successfully'
    finish_program()
  end

  def list_all_books
    arr_of_books = library.list_books
    arr_of_books.each do |book|
      puts "Title: '#{book.title}', Author: #{book.author}"
    end
    finish_program()
  end
end

class InputOptions
  include SpecialFuntions
  attr_accessor :library

  def initialize
    @library = Library.new
    display_first_ones
    first_one_selected(option: gets.chomp.to_i)
  end
  def display_first_ones
    puts 'Please choose an option by enterin a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end
  def first_one_selected(option: number)
    case option
      when 1
        list_all_books()
      when 2
        puts 'List all people'
      when 3
        create_a_person()
      when 4
        create_a_book()
      when 4
        puts 'Create a book'
      when 5
        puts 'Create a rental'
      when 6
        puts 'List all rentals for a given person id'
      when 7
        puts 'Exit'
      else
        puts 'Invalid option'
    end
  end

  def finish_program
    puts ' '
    display_first_ones()
    first_one_selected(option: gets.chomp.to_i)
  end
end

def main ()
  puts 'Welcome to School Library App!'
  options = InputOptions.new

end

main()