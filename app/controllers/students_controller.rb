class StudentsController < ApplicationController

  before_action :set_student_params, only: %i[edit update destroy]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
    @departments = Department.all
    @batches = Batch.all
  end

  def edit
    @departments = Department.all
    @batches = Batch.all
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_url, notice: 'Student was successfully created.'
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  def update
    if @student.update(student_params)
      redirect_to students_url, notice: 'Student was successfully updated.'
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  def destroy
    @student.delete

    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_student_params
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :gender, :age, :department_id, :batch_id)
  end
end
