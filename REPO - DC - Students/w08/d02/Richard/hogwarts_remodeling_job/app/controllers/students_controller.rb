class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show
    @student = Student.find_by(id: params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.save
    redirect_to students_path
  end


  private

  def student_params
      params.require(:student).permit(
        :name,
        :img_url,
        :house_id
    )
  end
end
