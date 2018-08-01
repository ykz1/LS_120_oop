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

puts "self here refers to the class Cat...it is defining a class method as opposed to an instance method"
puts "this means that cats_count cannot be called on an instance, but must be called on the Cat class"

puts Cat.cats_count
kat = Cat.new('tabby')
puts Cat.cats_count
puts kat.cats_count # produces and error