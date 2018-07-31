class Pet
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    @name.upcase!
    "My name is #{@name}."
  end
end

puts "Fluffy"
puts "My name is FLUFFY."
puts "FLUFFY"
puts "FLUFFY"
puts

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name