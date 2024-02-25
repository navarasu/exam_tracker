class ExamSchedule < ApplicationRecord
  belongs_to :exam_hall
  belongs_to :batch
  belongs_to :subject
  belongs_to :department
  has_one :attendance
end
