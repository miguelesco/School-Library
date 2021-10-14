require_relative 'corrector'
require_relative 'rental'

class Person
  attr_accessor :name, :age, :rental
  attr_reader :id, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rental = []
  end

  def can_use_services?
    is_of_age || @parent_permission
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  private

  def of_age
    @age >= 18
  end

  def add_rental(book, date)
    Rental.new(date, self, book)
  end
end

person = Person.new(21, 'Juan')

puts person.validate_name
