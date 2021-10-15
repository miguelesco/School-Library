require_relative 'clases/student'
require_relative 'clases/teacher'
require_relative 'clases/book'
require_relative 'clases/library'
require_relative 'clases/rental'

module SpecialFuntions
  def create_a_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    input = gets.chomp.to_i
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    case input
    when 1
      print 'Has parent permission? [Y/N]: '
      has_parent_permission = gets.chomp.upcase == 'Y'
      student = Student.new(age, name, parent_permission: has_parent_permission)
      people << student
      puts 'Person created successfully'

    when 2
      print 'Specialization: '
      specialization = gets.chomp
      teacher = Teacher.new(specialization, age, name)
      people << teacher
      puts 'Person created successfully'

    else
      puts 'Invalid input'
    end
    finish_program
  end

  def create_a_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    library.add_book(book)
    puts 'Book created successfully'
    finish_program
  end

  def list_all_books
    arr_of_books = library.list_books
    arr_of_books.each do |book|
      puts "Title: '#{book.title}', Author: #{book.author}"
    end
    finish_program
  end

  def list_all_people
    people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
    finish_program
  end

  def create_a_rental
    arr_of_books = library.list_books
    puts 'Select a book from the following list by number'
    arr_of_books.each_with_index do |book, index|
      puts " #{index}) Title: '#{book.title}', Author: #{book.author}"
    end
    select_book = gets.chomp.to_i
    puts ' '

    puts 'Select a person from the following list by number (not id)'
    people.each_with_index do |person, index|
      puts " #{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
    select_person = gets.chomp.to_i
    puts ' '

    puts 'Select a date (yyyy/mm/dd)'
    date = gets.chomp

    rental = Rental.new(date, people[select_person], arr_of_books[select_book])
    library.add_rental(rental)

    puts 'Rental created successfully'
    finish_program()
  end

  def list_all_rentals_by_id
    print 'ID of the person: '
    id = gets.chomp.to_i
    person_selected = people.find { |person| person.id == id }
    library.rentals.each do |rental|
      if rental.person == person_selected
        puts "Rentals: "
        puts "Date #{rental.date}, Book: '#{rental.book.title}' by: #{rental.book.author}"
      else 
        puts 'No rentals found by this user'
      end
    end
    finish_program()
  end
end

class InputOptions
  include SpecialFuntions
  attr_accessor :library, :people

  def initialize
    @library = Library.new
    @people = []
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
      list_all_books
    when 2
      list_all_people
    when 3
      create_a_person
    when 4
      create_a_book
    when 5
      create_a_rental
    when 6
      list_all_rentals_by_id
    when 7
      puts 'Exit'
    else
      puts 'Invalid option'
    end
  end

  def finish_program
    puts ' '
    display_first_ones
    first_one_selected(option: gets.chomp.to_i)
  end
end

def main()
  puts 'Welcome to School Library App!'
  InputOptions.new
end

main
