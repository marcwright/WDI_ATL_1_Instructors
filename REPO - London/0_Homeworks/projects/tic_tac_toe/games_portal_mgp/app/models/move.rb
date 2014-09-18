class Move < ActiveRecord::Base
  belongs_to :player, class_name: 'User'
  belongs_to :game
  attr_accessible :square, :symbol, :player_id

  after_create :check_if_game_is_won
  after_create :make_computer_move_if_necessary
  before_update :prevent_edits
  validates :square, inclusion: { in: (0..8), message: "%{value} is out of bounds" }
  validate :game_exists
  validate :player_exists
  validate :game_is_not_finished
  validate :player_is_playing_game
  validate :is_players_turn
  validate :square_is_not_taken

  alias :ar_player :player
  def player
    ar_player || :computer
  end

  private
  def check_if_game_is_won
    game.check_if_won!
  end

  private
  def make_computer_move_if_necessary
    game.reload
    if !game.finished? && game.whose_turn == :computer
      game.make_computer_move!
    end
  end

  private
  def game_exists
    errors.add :game, 'does not exist' unless game || Game.find_by_id(game_id)
  end

  private
  def player_exists
    errors.add :player, 'does not exist' unless player || Player.find_by_id(player_id)
  end

  private
  def square_is_not_taken
    errors.add :square, "is taken" if game.square_taken?(square)
  end

  private
  def game_is_not_finished
    errors.add :game, "is finished" if game.finished?
  end

  private
  def player_is_playing_game
    errors.add :base, "you're not my player" unless game.includes_player?(player)
  end

  private
  def is_players_turn
    errors.add :base, "it's not your turn" unless game.whose_turn == player
  end

  private
  def prevent_edits
    changes.empty? # will return 'false' and interrupt saving if there are any changes to save
  end

end
