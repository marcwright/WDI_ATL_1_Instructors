class StudentsController < ApplicationController

  def index
    @students = Student.all

    respond_to do |format|
      format.json{ render json: @students }
      format.html { render :index }
    end
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

    if @student.update(student_params)
      render json: @student
    else
      render status: 400, nothing: true
    end
  end

  def destroy
    @student = Student.find(params[:id])

    if @post.destroy
      render json: {}
    else
      render status: 400, nothing: true
    end
  end


  private

  def student_params
    params.require(:student).permit(:name, :email, :phone, :location, :employer, :misses_wdi)
  end
end
