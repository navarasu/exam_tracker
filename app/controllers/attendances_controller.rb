class AttendancesController < ApplicationController

  def index
    date = params[:date]
    date ||= Time.new.strftime('%d-%m-%Y')
    @exam_schedules = ExamSchedule.left_joins(:attendance).includes(:attendance).where(date: date)
    @exam_schedules_pending = @exam_schedules.select { |val| val.attendance.nil? }
    @exam_schedules_completed = @exam_schedules.select { |val| val.attendance.present? }
  end

  def new
    @attendance = Attendance.new
    @attendance.exam_schedule_id = params[:exam_schedule_id]
    @exam_schedule = @attendance.exam_schedule
    @students = Student.where(@exam_schedule.as_json.slice('batch_id', 'department_id'))
  end

  def create
    @attendance = Attendance.new(attendance_params)
    @attendance.created_by_id = current_user.id
    if @attendance.save
      redirect_to attendances_url, notice: 'Student was successfully created.'
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  def show
    @attendance = Attendance.find(params[:id])
    @exam_schedule = @attendance.exam_schedule
    @students = @attendance.students
    @students_absent = Student.where(@exam_schedule.as_json.slice('batch_id', 'department_id')).where.not(id: @students.pluck(:id))
  end

  def attendance_params
    params.require(:attendance).permit(:exam_schedule_id, student_ids: [])
  end
end
