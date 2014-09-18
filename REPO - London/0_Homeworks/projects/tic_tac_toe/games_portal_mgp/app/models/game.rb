class Game < ActiveRecord::Base
  attr_accessible :player2_id
  has_one :score
  has_many :moves
  belongs_to :player1, class_name: 'User'
  belongs_to :player2, class_name: 'User'

  validates :player1, presence: true

  WINNING_LINES = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]

  def winning_game?
    !!WINNING_LINES.detect do |winning_line|
      %w(XXX OOO).include?(winning_line.map { |e| moves_made_array[e] }.join)
    end
  end

  def board
    a = [nil,nil,nil,nil,nil,nil,nil,nil,nil]
    moves.each do |move|
      a[move.square] = move
    end
    return a
  end

  def moves_made_array
    board.map { |move| move.try(:symbol) }
  end

  def print_board
    moves_made_array.each_slice(3).each_with_index do |row, index|
      puts row.map{|e| e || ' '}.join(' | ')
      puts '---------' unless index == 2
    end
  end

  alias :ar_player2 :player2
  def player2
    ar_player2 || :computer
  end

  def make_move(player, square)
    player_id = player.id unless player == :computer
    moves.new player_id: player_id, square: square, symbol: which_symbol_for_player(player)
  end

  def make_computer_move!
    square = moves_made_array.each_with_index.map { |e,i| i unless e }.compact.sample
    make_move(:computer, square).save!
  end

  def whose_turn
    return player1 if moves.empty?
    moves.last.player == player1 ? player2 : player1
  end

  def which_symbol_for_player(player)
    raise "not my player!" unless includes_player?(player)
    player == player1 ? 'O' : 'X'
  end

  def square_taken?(square)
    !!moves_made_array[square]
  end

  def finished?
    winning_game? || moves_made_array.all?
  end

  def check_if_won!
    raise "already scored" if score
    reload
    if finished?
      if winning_game?
        winner, loser = get_winner_and_loser
        winner.scores.create! result: :win, value: 10, game_id: self.id unless winner == :computer
        loser.scores.create! result: :lose, value:0, game_id: self.id unless loser == :computer
      else
        player1.scores.create! result: :draw, value: 5, game_id: self.id
        player2.scores.create! result: :draw, value: 5, game_id: self.id unless player2 == :computer
      end
    end
  end

  def includes_player?(player)
    [player1, player2].compact.include?(player)
  end

  def get_winner_and_loser
    moves.last.player == player1 ? [player1, player2] : [player2, player1]
  end

end

# testing a two person game
# p1 = User.first
# p2 = User.last
# g = Game.new

# g.player1 = p1
# g.player2 = p2

# g.save!

# g.make_move(p1, 4).save!
# g.make_move(p2, 5).save!
# g.make_move(p1, 1).save!
# g.make_move(p2, 6).save!
# g.make_move(p1, 7).save!
# g.save!


# # testing a person vs. computer game
# p1 = User.first
# p2 = User.last
# g = Game.new
# g.player1 = p1

# g.save!
# move1 = nil
# move2 = nil
# until g.finished?
#   move1 = g.make_move p1, g.moves_made_array.each_with_index.map { |e,i| i unless e }.compact.sample
#   move1.save!
#   g.reload
# end
# g.save!




