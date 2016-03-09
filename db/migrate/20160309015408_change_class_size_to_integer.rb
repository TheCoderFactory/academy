class ChangeClassSizeToInteger < ActiveRecord::Migration
  def change
    change_column :course_intakes, :class_size,  :integer
  end
end
