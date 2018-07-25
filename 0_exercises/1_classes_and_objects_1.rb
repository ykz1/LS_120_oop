puts "Hello".class
puts 5.class
puts [1, 2, 3].class


module Walkable
  def walk
    puts "Let's walk"
  end
end

class Cat
  attr_accessor :name
  include Walkable

  def initialize(name)
    @name = name
    greet
  end

  def greet
    puts "Hi I'm #{name}"
  end
end

kitty = Cat.new("Sophie")
kitty.name = "Jenny"
kitty.greet
kitty.walk
