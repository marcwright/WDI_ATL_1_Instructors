class StudentsController < ActionController

  def index
  end

  def show
    @students = Student.find(params[:id])
  end

end
