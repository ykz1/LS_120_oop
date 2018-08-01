class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
  def self.hi
    puts "Hello from class"
  end
  def self.hello
    Greeting.new.greet("Hello from greeting")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

puts "Hello.hi calls class method Hello#hi"
puts "fix 1: define a class method self.hi that prints a message"
puts "fix 2: do 'Hello.new.hi' instead"
puts "fix 3: define a class method self.hi that creates a new Greeting object to call Greeting#greet on"

Hello.hi
Hello.new.hi
Hello.hello