
class InputOptions
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
        puts 'Create a person'
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
  options = InputOptions.new
  puts 'Welcome to School Library App!'
  options.display_first_ones
  firstOptionSelected = gets.chomp.to_i
  options.first_one_selected(option: firstOptionSelected)

end

main()