class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

puts "@@cats_count is a class variable that tracks how many instances exist"
puts "self.cats_count provides a class method to access the @@cats_count class variable"
puts

puts Cat.cats_count

Cat.new('black')

puts Cat.cats_count