class AddPhoneToAcademyApplication < ActiveRecord::Migration
  def change
    add_column :academy_applications, :phone, :string
  end
end
