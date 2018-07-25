class Cat
  ALL_COLOURS = "purple"
  @@total_count = 0

  def self.generic_greeting
    puts "Hello I'm a cat"
  end

  def self.total
    puts "There are #{@@total_count} cats"
  end

  attr_accessor :name

  def to_s
    "I'm #{name}"
  end

  def initialize(name)
    @name = name
    @@total_count += 1
  end

  def rename(new_name)
    self.name = new_name
  end

  def identify
    self
  end

  def personal_greeting
    puts "Hi! I'm #{name}. I am a #{ALL_COLOURS} cat."
  end

end

Cat.generic_greeting
kitty = Cat.new('Jenny')
kitty.class.generic_greeting

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

kitty = Cat.new('Sophie')
p kitty.name
kitty.rename('Chloe')
p kitty.name
p kitty.identify
Cat.generic_greeting
kitty.personal_greeting

Cat.total

puts kitty

class Person
  attr_writer :secret

  def share_secret
    puts secret
  end

  def compare_secret(person)
    secret == person.secret
  end

  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

puts person1.compare_secret(person2)
