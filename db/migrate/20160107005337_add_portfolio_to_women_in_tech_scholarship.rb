class AddPortfolioToWomenInTechScholarship < ActiveRecord::Migration
  def change
    add_column :women_in_tech_scholarships, :portfolio, :string
  end
end
