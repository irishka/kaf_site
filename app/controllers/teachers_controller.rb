class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all(:include => [:person, :degree, :position])
  end

  def show
    @teacher = Teacher.find(params[:id],:include => [:person, :degree, :position])
  end

end