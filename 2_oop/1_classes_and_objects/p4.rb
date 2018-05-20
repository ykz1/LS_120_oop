
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

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob.name == rob.name