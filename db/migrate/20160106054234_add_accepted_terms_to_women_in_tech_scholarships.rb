class AddAcceptedTermsToWomenInTechScholarships < ActiveRecord::Migration
  def change
    add_column :women_in_tech_scholarships, :accepted_terms, :boolean
  end
end
