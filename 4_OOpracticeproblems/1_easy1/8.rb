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

kat = Cat.new('tabby')
kat.make_one_year_older
kat.make_one_year_older_alt
p kat