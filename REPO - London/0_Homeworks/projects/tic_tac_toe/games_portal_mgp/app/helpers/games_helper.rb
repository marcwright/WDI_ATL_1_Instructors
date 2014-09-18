module GamesHelper

  def other_player_for_game(game)
    return game.player1.try(:name) if game.player2 == current_user
    game.player2 == :computer ? 'computer' : game.player2.try(:name)
  end

  def playing_x_or_o_for_game(game)
    game.player1 == current_user ? :X : :O
  end

  def game_status_for_game(game)
    unless game.finished?
      return "in play - #{game.whose_turn == current_user ? 'your' : possessive(other_player_for_game(game))} turn"
    end
    return 'draw' unless game.winning_game?
    winner, _loser = game.get_winner_and_loser
    winner == current_user ? 'you won' : 'you lost'
  end

end
