class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end



puts "This line instantiates a new intance of Television"
tv = Television.new
puts "This raises NoMethodError because we're trying to call a class method on an instance"
# tv.manufacturer
puts "This calls instance method #model correctly"
tv.model

puts "This calls class method #manufacturer correctly"
Television.manufacturer
puts "This raises NoMethodError because we're trying to call an instance method on a class"
# Television.model