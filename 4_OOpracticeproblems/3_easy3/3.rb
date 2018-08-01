class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

syl = AngryCat.new(20, 'Sylvester')
max = AngryCat.new(3, 'Maxie')
