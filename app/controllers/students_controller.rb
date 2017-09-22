class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @all_students = Student.all

    #implicit render 'students/index'
  end

  def show
    set_student
    if @student.active
      @active = "active"
    else
      @active = "inactive"
    end
    #implicit render 'students/show'
  end

  def update
    #the put/patch method to update @student
    set_student
    switch = !(@student.active)
    @student.update(active: switch)
    redirect_to student_path(@student)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
