class Student < ApplicationRecord
  enum gender: %w[male female]
end
