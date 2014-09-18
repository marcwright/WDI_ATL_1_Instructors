class PeopleController < ApplicationController

  before_action :set_person, :only => [:show, :edit, :update, :destroy]

  def index
    @person_search = PersonSearch.new(person_search_params)
    @people = @person_search.matches
  end

  def show
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      flash[:success] = "New person created."
      redirect_to people_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update

    if @person.update(person_params)
      flash[:success] = "Person successfully updated"
      redirect_to people_path
    else
      render 'edit'
    end

  end

  def destroy
    @person.destroy
    redirect_to people_path
  end

  protected

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:name, :age, :height_in_inches, :eye_color, :hair_color)
  end

  def person_search_params
    if params[:person_search]
      params.require(:person_search).permit(:age, :hair_color, :eye_color)
    else
      {}
    end
  end
end
