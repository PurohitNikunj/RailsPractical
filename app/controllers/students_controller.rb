# import date library
require 'date'

class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @new_student = Student.new
    @new_student.birthdate = Date.today
  end

  def create
    @new_student = Student.new(student_params)
    if @new_student.save
      redirect_to 
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @edit_student = Student.find(params[:id])
  end

  def update
    @edit_student = Student.find(params[:id])

    if @edit_student.update(student_params)
      redirect_to 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path, status: :see_other
  end

  def terms
  end

  private
  def student_params
    params.require(:student).permit(:first_name,:last_name,:birthdate,:department,:agree)
  end

end
