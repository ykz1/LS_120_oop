module BoatPullable
  def pull_boat
    "Can pull boat"
  end
end

class Vehicle
  attr_accessor :color, :model, :speed, :engine
  attr_reader :year

  @@count_vehicles = 0

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
    @engine = false
    @@count_vehicles += 1
    @creation_time = Time.new
  end

  def self.count_of_vehicles
    "There are #{@@count_vehicles} vehicles"
  end

  def self.gas_mileage(miles, gallons)
    "Your gas mileage is #{miles / gallons} m/g"
  end
  def to_s
    "This is a car! A #{year} #{model}"
  end

  def speed_up(increase)
    return "You need to turn the engine on first!" if !engine
    self.speed += increase
    "You increased speed by #{increase} to #{speed}"
  end

  def brake
    return "You need to be moving first!" if !engine || self.speed == 0
    self.speed = 0
    "You stopped to a speed of #{speed}"
  end

  def ignition
    self.engine = !self.engine
    "You have turned the engine #{self.engine ? 'on' : 'off'}"
  end

  def spray_paint(color)
    self.color = color
    "#{self.model} now #{self.color}"
  end

  def age_in_years
    return_age
  end
  
  private

  def return_age
    Time.new.year - self.year
  end
end


class MyCar < Vehicle
  DESCRIPTION = 'Sedans, coupes, hatchbacks, etc'
end

class MyTruck < Vehicle
  DESCRIPTION = 'Pickups, SUVs, vans, etc'
  include BoatPullable
end

yaris = MyCar.new(2018, 'Silver', 'Yaris')

puts yaris.ignition
3.times { puts yaris.speed_up(10) }
puts yaris.brake
puts yaris.ignition
puts yaris.spray_paint("Yellow")
puts yaris
puts
puts yaris.class.ancestors
puts
chevy = MyTruck.new(2015, 'Black', 'Like a rock')
puts chevy.class.ancestors
puts
puts Vehicle.count_of_vehicles
puts
puts chevy.pull_boat
# puts yaris.pull_boat => Cannot pull boat
puts 
puts yaris.age_in_years
puts chevy.age_in_years


# ---------------------------------------
class Student
  attr_accessor :name
  
  def self.what_is
    "Is a Student!" + self.also_is
  end

  def self.also_is
    "also human!"
  end

  def initialize(name, grade)
    @name = name
    @grade = grade
    #puts what_is => can't call a class method from an instance method
  end

  def better_grade_than?(student)
    grade > student.grade
  end
  def get_grade
    grade
  end
  protected
  attr_reader :grade
end

joe = Student.new('Joe', 90)
bob = Student.new('Bob', 80)

puts "Well Done!" if joe.better_grade_than?(bob)
puts joe.name#, joe.grade

puts Student.what_is

# -------
class Student
  attr_accessor :name, :grade
  def initialize(name)
    @name = name
    @grade = nil
  end
  def changegrade(str)
    self.grade = str
  end
end

kyle = Student.new('kyle')
kyle.changegrade('A')
p kyle.grade

# ---------------
class Secret
  def share_secret
    "The secret is #{self.secret}"
  end
  protected
  def secret
    "shhh"
  end
end

p Secret.new.share_secret