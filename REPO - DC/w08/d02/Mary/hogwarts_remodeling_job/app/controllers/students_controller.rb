class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @house = House.find_by(name: params[:student][:house])
    @student = Student.create( {
      name: params[:student][:name],
      house_id: @house.id,
      img_url: params[:student][:img_url]
    })
    redirect_to(student_path(student))
  end

  def show
    @student = Student.find(params[:id])
  end

end
