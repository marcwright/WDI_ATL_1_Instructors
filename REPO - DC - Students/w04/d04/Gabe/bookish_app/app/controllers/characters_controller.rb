class CharactersController < ApplicationController

def index
  @characters = Character.all
  render :index
end

def new
    render :new
end

def create
  Character.create(name: params[:name], quirk: params[:quirk], gender: params[:gender])
  redirect_to '/authors/#{books.author_id}/books'
end


def show
  @character = Character.find(params[:id])
  render :show
end

def edit
    @character = Character.find(params[:id])
    render :edit
  end

#  def update
#  character = Character.find(params[:id])
#character.update (name: params[:name], quirk: params[:quirk], gender: params[:gender])
#    redirect_to("/books/#{character.book_id}/characters/")
#  end

  def destroy
  character = Character.find(params[:id])
  character.destroy
 redirect_to("/characters/#{books.author_id}/books")
end


end
