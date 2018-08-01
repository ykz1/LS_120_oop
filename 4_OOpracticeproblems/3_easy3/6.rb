class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end

  def make_one_year_older_alt
    @age += 1
  end
end

limbo = Cat.new('Schrodinger')
limbo.make_one_year_older
puts limbo.age
limbo.make_one_year_older_alt
puts limbo.age
