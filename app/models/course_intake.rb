class CourseIntake < ActiveRecord::Base
  validates :start_date, :finish_date, :campus, :class_size, presence: true
end
