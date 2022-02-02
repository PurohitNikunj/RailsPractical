# import date library
require 'date'

class FacultiesController < ApplicationController

  def index
    @faculties = Faculty.all
  end


  def new
    @new_faculty = Faculty.new
    @new_faculty.birthdate = Date.today
  end

  def create
    @new_faculty = Faculty.new(faculty_params)
    if @new_faculty.save
      redirect_to
    else
      render :new, status: :unprocessable_entity
    end
  end


  def show
    @faculty = Faculty.find(params[:id])
  end


  def edit
    @edit_faculty = Faculty.find(params[:id])
  end

  def update
    @edit_faculty = Faculty.find(params[:id])
    if @edit_faculty.update(faculty_params)
      redirect_to
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @faculty = Faculty.find(params[:id])
    @faculty.destroy
    redirect_to faculties_path, status: :see_other
  end

  
  private
  def faculty_params
    params.require(:faculty).permit(:first_name,:last_name,:birthdate,:emailid,:phoneno,:designation)
  end
end
