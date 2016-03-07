class CreateCourseIntakes < ActiveRecord::Migration
  def change
    create_table :course_intakes do |t|
      t.date   :start_date
      t.date  :finish_date
      t.string :campus
      t.string :class_size

      t.timestamps null: false
    end
  end
end
