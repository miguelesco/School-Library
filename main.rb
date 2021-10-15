require_relative 'clases/library'
require_relative 'clases/library'
require_relative 'modules/main_functions'

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
      exit_program
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
