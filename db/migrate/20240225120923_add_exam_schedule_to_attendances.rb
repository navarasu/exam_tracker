class AddExamScheduleToAttendances < ActiveRecord::Migration[7.1]
  def change
    add_reference :attendances, :exam_schedule, null: false, foreign_key: true, index: { unique: true }
  end
end
