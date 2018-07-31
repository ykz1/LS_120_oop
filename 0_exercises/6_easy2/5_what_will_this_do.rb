class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

puts "ByeBye"
puts "HelloHello"
puts

thing = Something.new
puts Something.dupdata
puts thing.dupdata
