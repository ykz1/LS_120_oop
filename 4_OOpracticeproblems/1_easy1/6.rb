class Cube
  attr_reader :volume
  def initialize(volume)
    @volume = volume
  end
  def get_volume
    @volume
  end
end

cubie = Cube.new(100)

puts "3 ways: #instance_variable_get method, attr_reader for :volume, get_number method"
puts cubie.instance_variable_get("@volume")
puts cubie.volume
puts cubie.get_volume