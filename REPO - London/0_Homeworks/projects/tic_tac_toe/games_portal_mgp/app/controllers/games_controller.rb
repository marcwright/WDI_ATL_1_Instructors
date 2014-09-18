class GamesController < ApplicationController
  load_and_authorize_resource

  # GET /games
  # GET /games.json
  def index
    @games = current_user.games
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/new
  # GET /games/new.json
  def new
    populate_players
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @game }
    end
  end

  # POST /games
  # POST /games.json
  def create
    @game = current_user.games_as_player1.new(params[:game])

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render json: @game, status: :created, location: @game }
      else
        populate_players
        format.html { render action: "new" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  def make_move
    respond_to do |format|
      move = @game.make_move(current_user, params[:square])
      if move.save
        format.html { redirect_to @game, notice: 'Move was successfully made.' }
        format.json { render json: @game, status: :created, location: @game }
      else
        format.html { redirect_to @game, alert: "Move was not made, because #{move.errors.full_messages.to_sentence}" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

private
def populate_players
  computer_user = User.new(name: :computer)
  computer_user.id = 0
  @players = User.excluding(current_user).all.unshift(computer_user)
end



end
