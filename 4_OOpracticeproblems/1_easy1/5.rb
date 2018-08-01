class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

puts "Pizza has an instance variable."
puts "@name initializes an instance variable. name (in Fruit) is a local variable"
