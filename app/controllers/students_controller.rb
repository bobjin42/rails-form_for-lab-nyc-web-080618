class StudentsController < ApplicationController

  # before_action :set_student
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)
    redirect_to student_path(@student.id)
  end

  def show
    set_student
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    redirect_to student_path(@student)
  end

  def edit
    set_student
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end
