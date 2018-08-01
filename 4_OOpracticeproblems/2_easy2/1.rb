class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

puts "It'll return one of the elements in array defined in #choices method"

oracle = Oracle.new
puts oracle.predict_the_future