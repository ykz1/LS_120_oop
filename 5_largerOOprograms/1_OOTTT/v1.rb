# Two players battle it out on a 3x3 board
# Plays take turns marking squares
# First player to mark three square in a row wins

# Nouns: board, player, square
# Verbs: play, mark, win
require 'pry'
class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                   [1, 4, 7], [2, 5, 8], [3, 6, 9],
                   [1, 5, 9], [3, 5, 7]]
  INITIAL_MARKER = ' '
  attr_reader :squares
  def initialize
    @squares = {}
    (1..9).each {|key| @squares[key] = Square.new(INITIAL_MARKER)}
  end
  def set_square(position, marker)
    @squares[position].state = marker
  end
  def unmarked_keys
    squares.select {|_, square| square.state == INITIAL_MARKER}.keys
  end
  def display
    puts "   #{squares[1]} | #{squares[2]} | #{squares[3]}"
    puts "  ---+---+---"
    puts "   #{squares[4]} | #{squares[5]} | #{squares[6]}"
    puts "  ---+---+---"
    puts "   #{squares[7]} | #{squares[8]} | #{squares[9]}"
  end
  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!detect_winner
  end

  def detect_winner
    WINNING_LINES.each do |keys|
      return 'X' if keys.all? { |key| squares[key].state == 'X' }
      return 'O' if keys.all? { |key| squares[key].state == 'O' }
    end
    return nil
  end

end

class Square
  attr_accessor :state
  def initialize(marker)
    @state = marker
  end
  def to_s
    state
  end
end

class Player
  attr_reader :marker
  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  attr_reader :gameboard, :player, :computer
  def initialize
    @gameboard = Board.new
    @player = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end
  
  def display_welcome_message
    system "clear"
    puts "Welcome to Tic Tac Toe!"
    puts
  end

  def display_end_game
    display_board
    if gameboard.detect_winner == 'X'
      puts "You win!"
    elsif gameboard.detect_winner == 'O'
      puts "You lose!"
    else
      puts "It's a tie!"
    end
    puts "Thanks for playing!"
  end

  def display_board
    system "clear"
    gameboard.display
  end

  def human_takes_turn
    puts "Choose an open square: #{gameboard.unmarked_keys.join(', ')}"
    input = ''
    loop do
      input = gets.chomp.to_i
      break if gameboard.unmarked_keys.include?(input)
      puts "That's not a valid choice."
    end
    gameboard.set_square(input, player.marker)
  end

  def computer_takes_turn
    gameboard.set_square(gameboard.unmarked_keys.sample, computer.marker)
  end
  
  def play
    display_welcome_message
    display_board
    loop do
      human_takes_turn
      display_board
      break if gameboard.full? || gameboard.someone_won?
      computer_takes_turn
      display_board
      break if gameboard.full? || gameboard.someone_won?
    end
    display_end_game
  end
end

game = TTTGame.new
game.play

