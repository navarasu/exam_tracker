class Attendance < ApplicationRecord
  has_many :attendance_students
  has_many :students, through: :attendance_students

  belongs_to :exam_schedule
end
