class ExamSchedulesController < ApplicationController
  before_action :set_exam_schedule_params, only: %i[edit update destroy]

  def index
    @exam_schedules = ExamSchedule.all
  end

  def new
    @exam_schedule = ExamSchedule.new
  end

  def edit
    @departments = Department.all
    @batches = Batch.all
  end

  def create
    @exam_schedule = ExamSchedule.create(exam_schedule_params)
    if @exam_schedule.save
      redirect_to exam_schedules_url, notice: 'ExamSchedule was successfully created.'
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  def update
    if @exam_schedule.update(exam_schedule_params)
      redirect_to exam_schedules_url, notice: 'ExamSchedule was successfully updated.'
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  def destroy
    @exam_schedule.delete

    respond_to do |format|
      format.html { redirect_to exam_schedules_url, notice: 'ExamSchedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_exam_schedule_params
    @exam_schedule = ExamSchedule.find(params[:id])
  end

  def exam_schedule_params
    params.require(:exam_schedule).permit(:date, :exam_id, :department_id, :batch_id, :subject_id, :exam_hall_id)

  end
end
