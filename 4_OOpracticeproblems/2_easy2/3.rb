

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

puts "Orange, Taste, Object, Kernel, BasicObject"
puts Orange.ancestors
puts

puts "HotSauce, Taste, Object, Kernel, BasicObject"
puts HotSauce.ancestors

