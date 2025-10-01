require "csv"
class StudentsController < ApplicationController
  before_action :set_student, only: [ :show, :destroy ]
  def index
    @students = Student.all
  end
  def show
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render :new, status: :unprocessable_entity
    end
  end

  def import
    file = params[:file]
    if file.nil?
      redirect_to students_path, alert: "Please upload a file."
      return
    end

    count = 0
    CSV.foreach(file.path, headers: true) do |row|
      s = Student.create(
        name: row["name"],
        email: row["email"],
        grade: row["grade"]
      )
      count += 1 if s.persisted?
    end
    redirect_to students_path, notice: "#{count} student(s) ploaded successfully."
  end

  def destroy
    @student.destroy
    redirect_to students_path, status: :see_other
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:name, :email, :grade)
    end
end
