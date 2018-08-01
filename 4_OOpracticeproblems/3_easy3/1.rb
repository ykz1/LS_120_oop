class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

puts "case 1: will print 'Hello'"
hello = Hello.new
hello.hi

puts "case 2: will raise NoMethodError because #bye is not found in lookup tree"
hello = Hello.new
# hello.bye

puts "case 3: will raise ArgumentError because no argument is supplied to Greeting#greet"
hello = Hello.new
# hello.greet

puts "case 4: will print 'Goodbye' becaues supplied to Greeting#greet"
hello = Hello.new
hello.greet("Goodbye")

puts "case 5: will raise NoMethodError because class method 'hi' is not defined for Hello class"
# Hello.hi