class Cat
  attr_accessor :name
  def initialize(name)
    @name = name
    puts "Hi I'm #{name}"
  end
end

kitty = Cat.new("Sophie")