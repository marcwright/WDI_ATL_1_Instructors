class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(name: params[:name], img_url: params[:img_url])
    redirect_to student_path(@student)
  end

  def show
    @student = Student.find(params[:id])
  end

end
