class SubjectsController < ApplicationController
  before_action :set_subject_params, only: %i[edit update destroy]
  def index
    @subjects = Subject.all

  end
  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.create(subject_params)
    if @subject.save
      redirect_to subjects_url, notice: 'Subject was successfully created.'
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  def edit
  end
    
  def update
    if @subject.update(subject_params)
      redirect_to subjects_url, notice: 'Subject was successfully updated.'
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  def destroy
    @subject.delete

    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'Subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_subject_params
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name)
  end
end
