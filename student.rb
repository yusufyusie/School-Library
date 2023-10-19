require_relative 'person'
class Student < Person
  attr_accessor :classroom

  def initialize(name: 'Unknown', age: 0, parent_permission: true, classroom: 'Unknown')
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end
end
