class CourseIntake < ActiveRecord::Base
  validates :start_date, :finish_date, :campus, :class_size, presence: true

  has_many :academy_applications
  has_many :women_in_tech_scholarships
end
