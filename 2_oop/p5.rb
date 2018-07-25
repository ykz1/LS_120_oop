
class Person
  attr_accessor :first_name, :last_name

  def initialize(name)
    fullname(name)
  end

  def name
    [first_name, last_name].join(' ').strip
  end

  def name=(name)
    fullname(name)
  end

  def to_s
    name
  end

  private

  def fullname(name)
    @first_name = name.split[0]
    @last_name = name.split[1]
  end

end


bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"

class Student
  attr_accessor :grade
  def initialize(name, grade=nil)
    @name = name
  end
  def speak
    "#{self}"
  end
  def self.speak
    "Student"
  end
end

class Kindergarten < Student
  def self.speak
    "Kinder"
  end
end

kyle = Student.new('Kyle')
p kyle

p Student.new('hi').speak

p Kindergarten::speak
p Student::speak