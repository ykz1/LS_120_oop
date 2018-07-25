# -------------------------------
class RPSLSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    display_welcome_message
    human.enter_name
    loop do
      human.choose
      computer.choose
      compute_winner
      break unless play_again?
    end
    display_endgame_message
  end

  def display_welcome_message
    system "Clear"
    puts "Welcome to Kyle's object-oriented Rock Paper Scissors Lizard Spock!"
  end

  def compute_winner
    puts return_hands
    message = ''

    if human.hand > computer.hand
      record_win(human)
      message = "#{human.name} wins!"
    elsif computer.hand > human.hand
      record_win(computer)
      message = "#{computer.name} wins!"
    else
      puts "It's a tie!"
      message = "It's a tie!"
    end

    display_score

    Move.history['messages'] << message + ' ' + return_hands
  end

  def return_hands
    "#{human} chooses #{human.hand}, #{computer} chooses #{computer.hand}."
  end

  def record_win(player)
    puts "#{player} wins!"
    player.score += 1
  end

  def display_score
    puts "The score is: #{human} #{human.score} - #{computer.score} #{computer}"
  end

  def play_again?
    puts "Would you like to play again? (y/n)"
    response = ''
    loop do
      response = gets.chomp.downcase
      break if %w[y n].include? response
      puts "Enter a valid input: 'y' or 'n'"
    end
    response == 'y'
  end

  def display_endgame_message
    puts "Game history:"
    Move.history['messages'].each_with_index do |message, idx|
      puts ">> Round #{idx + 1}: #{message}"
    end
    puts "Thanks for playing!"
  end
end

# -------------------------------
class Move
  @@history = Hash.new(0)
  @@history['messages'] = []
  ALLOWED_MOVES = %w[rock paper scissors lizard spock]

  WIN_GRID = {  'scissors' => %w[paper lizard],
                'paper' =>    %w[rock spock],
                'rock' =>     %w[lizard scissors],
                'lizard' =>   %w[spock paper],
                'spock' =>    %w[scissors rock] }
  def self.initialize_history(player)
    @@history[player] = []
  end

  def self.history
    @@history
  end

  attr_accessor :move

  def initialize(move, player)
    @move = move
    @@history[player] << move
  end

  def to_s
    move
  end

  def >(other_move)
    WIN_GRID[move].include? other_move.to_s
  end
end

# -------------------------------
class Player
  attr_accessor :name, :hand, :score

  def initialize
    @score = 0
  end

  def to_s
    @name
  end
end

# -------------------------------
class Human < Player
  def enter_name
    puts "What is your name?"
    self.name = gets.chomp
    Move.initialize_history(self.name)
  end

  def choose
    puts "Pick a valid move: #{Move::ALLOWED_MOVES.join(', ')}"

    selection = ''

    loop do
      selection = gets.chomp
      break if Move::ALLOWED_MOVES.include?(selection)
      puts "Pick a valid move!"
    end

    self.hand = Move.new(selection, self.name)
  end
end

# -------------------------------
class Computer < Player
  def initialize
    self.name = %w[R2D2 Chappie Robocop].sample
    Move.initialize_history(self.name)
    super
  end

  def choose
    self.hand = Move.new(Move::ALLOWED_MOVES.sample, self.name)
  end
end

# -------------------------------
RPSLSGame.new.play
