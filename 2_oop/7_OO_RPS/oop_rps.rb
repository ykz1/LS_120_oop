=begin
objects: players, hands
verbs: choose, compare
=end
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new
    @computer = Player.new('computer')
  end

  def play
    display_welcome_message
    human.choose
    computer.choose
    display_winner
    display_endgame_message
  end

  def display_welcome_message
    puts "Welcome to Kyle's object-oriented Rock Paper Scissors!"
    puts "What is your name?"
    @human.name = gets.chomp
    puts "Alright #{@human.name}, let's play!"
    puts
  end

  def display_endgame_message
    puts "Thanks for playing. Would you like to play again? (y/n)"
    play unless gets.chomp == 'n'
  end
  
  def display_winner
  end

end

class Player
  ALLOWED_MOVES = %w(rock paper scissors)
  attr_accessor :player_type, :name, :hand, :score

  def initialize(player_type = 'human')
    @player_type = player_type
    @score = 0
  end

  def choose
    if player_type == 'human'
      puts "Pick either 'rock', 'paper', or 'scissors'!"
      loop do
        selection = gets.chomp
        @hand = selection
        break if ALLOWED_MOVES.include?(selection)
        puts "Pick a valid move!"
      end
    else
      @hand = ALLOWED_MOVES.sample
    end
  end
end

RPSGame.new.play

