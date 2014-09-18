class StudentsController < ApplicationController

  def index
    @students = Student.all
    render json: @students
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      render json: @student
    else
      render status: 400, nothing: true
    end
  end

  def update

  end

  def show

  end

  def destroy

  end

  private

  def student_params
    params.require(:student).permit(:name)
  end

end
