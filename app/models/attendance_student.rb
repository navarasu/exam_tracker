class AttendanceStudent < ApplicationRecord
  belongs_to :attendance
  belongs_to :student
end
