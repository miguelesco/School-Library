require_relative 'clases/student'
require_relative 'clases/teacher'


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
    puts ' '
    display_first_ones()
    first_one_selected(option: gets.chomp.to_i)
  end
end

class InputOptions
  include SpecialFuntions

  def initialize
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
        puts 'List all books'
      when 2
        puts 'List all people'
      when 3
        create_a_person()
      when 4
        puts 'Create a book'
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
end

def main ()
  puts 'Welcome to School Library App!'
  options = InputOptions.new

end

main()