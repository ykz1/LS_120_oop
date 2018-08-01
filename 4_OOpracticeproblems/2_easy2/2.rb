class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

puts "#predict_the_future will look in RoadTrip#choices before Oracle#choices, so will sample one of those"

trip = RoadTrip.new
puts trip.predict_the_future