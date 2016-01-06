class CreateWomenInTechScholarships < ActiveRecord::Migration
  def change
    create_table :women_in_tech_scholarships do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :reason
      t.string :career
      t.string :links

      t.timestamps null: false
    end
  end
end
