class Board
  attr_accessor :board

  def initialize
    self.board = create_board
  end

  def create_board
    board = {}
    positions = %i[top_l top_c top_r
                   mid_l mid_c mid_r
                   bottom_l bottom_c bottom_r]
    positions.each { |key| board[key] = nil }
    board
  end

  def can_play?(position)
    board[position].nil?
  end

  def positions_available?
    board.value? nil
  end

  def available_positions
    p = board.select { |_k, v| v.nil? }
    p.keys.join(', ')   # comma separate the results
  end

  def play(position, symbol)
    board[position] = symbol
  end
end

class Player
  attr_reader :symbol, :name

  def initialize(n, s)
    @name = n
    @symbol = s
  end

  def self.create_player_one
    Player.new('Player 1', :o)
  end

  def self.create_player_two
    Player.new("Player 2", :x)
  end
end

class Game
  attr_reader :p1, :p2, :board, :p1_turn

  def initialize
    @p1 = Player.create_player_one
    @p2 = Player.create_player_two
    @board = Board.new
    @p1_turn = true
  end

  def start
    play_round while board.positions_available?
  end

  def play_round
    player = current_player
    player_prompt
    next_move = gets.chomp
    board.play(next_move, player.symbol)
  end

  def player_prompt
    puts current_player
    puts "Available positions: #{board.available_positions}"
    print 'Input your next move: '
  end

  def current_player
    if p1_turn
      p1
    else
      p2
    end
  end
end

# b = Board.new
# p1 = Player.create_player_one
# p2 = Player.create_player_two
# puts b.positions_available?
# p p1
# p p2

game = Game.new
game.start
