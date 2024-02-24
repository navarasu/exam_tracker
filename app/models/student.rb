class Student < ApplicationRecord
  enum gender: %w[male female]

  belongs_to :department
  belongs_to :batch
end
