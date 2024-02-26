class DepartmentsController < ApplicationController
  before_action :set_department_params, only: %i[edit update destroy]
  def index
    @department = Department.all
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.create(department_params)
    if @department.save
      redirect_to departments_url, notice: 'Department was successfully created.'
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @department.update(department_params)
      redirect_to departments_url, notice: 'Department was successfully updated.'
    else
      render :form_update, status: :unprocessable_entity
    end
  
  end

  def destroy
    @department.delete

    respond_to do |format|
      format.html { redirect_to departments_url, notice: 'Depatment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end

def set_department_params
  @department = Department.find(params[:id])
end

def department_params
  params.require(:department).permit(:name)
end