class StudentController < ApplicationController

  def index
  end

  def show
    @student = Student.find(:id)
  end

end