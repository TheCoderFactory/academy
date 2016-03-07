class AddIntakeToApplication < ActiveRecord::Migration
  def change
    add_reference :women_in_tech_scholarships, :course_intake
    add_reference :academy_applications, :course_intake
  end
end
