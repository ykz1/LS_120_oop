class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
  def play
    "Playing Bingo!"
  end
end

puts "Bingo#play would be higher the calling order and Game#play will not be called"

puts Bingo.new.play