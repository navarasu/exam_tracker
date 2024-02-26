class ExamHallsController < ApplicationController
  before_action :set_exam_hall_params, only: %i[edit update destroy]
  def index
    @exam_halls = ExamHall.all
  end

  def new
    @exam_hall = ExamHall.new
  end

  def create
    @exam_hall = ExamHall.new(exam_hall_params)

    if @exam_hall.save
      redirect_to exam_halls_url, notice: 'Examhall was successfully created.'
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @exam_hall.update(exam_hall_params)
      redirect_to exam_halls_url, notice: 'Exam_hall was successfully updated.'
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  def destroy
    @exam_hall.delete

    respond_to do |format|
      format.html { redirect_to exam_halls_url, notice: 'Exam_hall was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_exam_hall_params
    @exam_hall = ExamHall.find(params[:id])
  end

  def exam_hall_params
    params.require(:exam_hall).permit(:no)
  end
end
