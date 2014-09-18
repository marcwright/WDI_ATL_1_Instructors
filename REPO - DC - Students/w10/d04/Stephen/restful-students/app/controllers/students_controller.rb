#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-06-26 15:49:17
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-06-26 16:58:03

class StudentsController < ApplicationController
  def index
    @students = Student.order(:name)

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @students }
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

    if @student.destroy
      render json: {}
    else
      render status: 400, nothing: true
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :phone, :location, :employment)
  end
end
