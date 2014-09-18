class StudentsController < ApplicationController

  def index
    @students = Student.order(:name)
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
    @student = Student.find(params[:id])
    if @student.update(link_params)
      render json: @student
    else
      render status: 400, nothing: true
    end
  end

  def destroy
    @student = Student.find(params[:id])
  end

  private

    def student_params
      params.require(:student).permit(:name, :email, :phone, :location, :employer, :misses_wdi)
    end

end
