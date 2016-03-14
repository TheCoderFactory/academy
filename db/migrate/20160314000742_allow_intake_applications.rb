class AllowIntakeApplications < ActiveRecord::Migration
  def change
    add_column :course_intakes, :allow_academy_applications, :boolean
    add_column :course_intakes, :allow_scholarship_applications, :boolean
  end
end
