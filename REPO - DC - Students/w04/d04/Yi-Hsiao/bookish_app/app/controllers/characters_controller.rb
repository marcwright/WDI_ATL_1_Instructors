class CharactersController < ApplicationController
  before_action :find_book, only: [:new, :create]
  before_action :find_character, only: [:show, :edit, :update]

  def new
    @character = @book.characters.new
  end

  def create
    @character = Character.new(character_params)

    if @character.save
      @book.characters << @character
      redirect_to @character
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @character.update(character_params)
      redirect_to @character
    else
      render "edit"
    end
  end

  private
  def find_book
    @book = Book.find params[:book_id]
  end

  def find_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:name, :gender, :quirk, :book_ids)
  end
end
