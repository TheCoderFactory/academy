class AddAgeToWomenInTechScholarships < ActiveRecord::Migration
  def change
    add_column :women_in_tech_scholarships, :age, :integer
  end
end
