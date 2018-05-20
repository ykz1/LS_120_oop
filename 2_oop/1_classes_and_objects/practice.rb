# Lecture practice problems

megacounter = 1

q = lambda do
  puts "----"
  puts "Q#{megacounter}"
  megacounter += 1
end

# ---
q.call

class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new('bob')
p bob.name                  # => 'bob'
bob.name = 'Robert'
p bob.name                  # => 'Robert'

# ---
q.call

