class UpdateSpreadsheetController < ApplicationController
  before_action :authenticate_user! , only: [:update, :course_intake]

  def update
    UpdateSpreadsheetJob.perform_async
    redirect_to(:back)
  end

  def course_intake
    course_intake = CourseIntake.first
    academy_applications = AcademyApplication.all
    scholarship_applications = WomenInTechScholarship.all
    academy_applications.each do |aa|
      aa.update_attribute(:course_intake, course_intake)
    end
    scholarship_applications.each do |sa|
      sa.update_attribute(:course_intake, course_intake)
    end
    redirect_to(:back)
  end
end
