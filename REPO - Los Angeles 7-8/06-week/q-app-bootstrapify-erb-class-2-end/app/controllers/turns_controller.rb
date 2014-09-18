class TurnsController < ApplicationController

  def index
    # this is for the adding to the queue modal
    @turn = Turn.new

    # this is showing the queue
    @turns = Turn.all

    # this showing all the features
    @features = Feature.all
    name_instructor
  end

  def admin
    @turns = Turn.all
    name_instructor
  end

  def name_instructor
    teachers = [
      "Richard, Mel and Andrew",
      "Jonny, Matthias, and Evan",
      "Lorin, Mer, and Mel",
      "Alfonso, Evan, and Andrew"]

    t = Time.now.strftime("%A")
    case t
    when "Monday"
      @office_hours_helpers = "#{teachers[0]}!"
    when "Tuesday"
      @office_hours_helpers = "#{teachers[1]}!"
    when "Wednesday"
      @office_hours_helpers = "#{teachers[2]}!"
    when "Thursday"
      @office_hours_helpers = "#{teachers[3]}!"
    end
  end

  def new
    @turn = Turn.new
  end

  def show
    @turn = Turn.find(params[:id])
  end

  def create
    @turn = Turn.new(params.require(:turn).permit(:subject, :question, :user_id))

    @turn.user_id = current_user.id

    if @turn.save
      redirect_to turns_path
    else
      render 'new'
    end
  end

  def edit
    @turn = Turn.find(params[:id])
  end

  def update
    @turn = Turn.find(params[:id])
    if @turn.update_attributes(params.require(:turn).permit(:name, :subject, :question))
      redirect_to turns_path
    else
      render 'edit'
    end
  end

  def destroy
    @turn = Turn.find(params[:id])
    @turn.destroy
    redirect_to turns_path
  end

end
