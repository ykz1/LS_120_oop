
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

  private

  def fullname(name)
    @first_name = name.split[0]
    @last_name = name.split[1]
  end

end


bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'