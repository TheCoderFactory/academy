class ChangeClassSizeToInteger < ActiveRecord::Migration
  def change
    remove_column :course_intakes, :class_size, :string
    add_column :course_intakes, :class_size, :integer
  end
end
