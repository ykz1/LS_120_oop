module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

Car.new.go_fast

puts
puts "self.Class returns the name of the class, in this instance 'Car'"
