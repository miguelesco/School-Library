require_relative 'person'

class Teacher < Person
  def initialize(specialization, age, name = 'Unkown', parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

teacher = Teacher.new('Ruby', 30, 'Juan', false)
teacher.can_use_services?
