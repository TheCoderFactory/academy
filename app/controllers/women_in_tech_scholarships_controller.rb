class WomenInTechScholarshipsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @women_in_tech_scholarship = WomenInTechScholarship.new
  end

  def create
    @women_in_tech_scholarship = WomenInTechScholarship.new(women_in_tech_scholarship_params)
    if @women_in_tech_scholarship.save
      # @women_in_tech_scholarship.send_emails
      redirect_to controller: "pages", action: "confirmation", type: "application"
    else
      respond_with(@women_in_tech_scholarship)
    end

  end

  def destroy
    @women_in_tech_scholarship = WomenInTechScholarship.find(params[:id])
    @women_in_tech_scholarship.destroy
  end

  private
  def women_in_tech_scholarship_params
    params.require(:women_in_tech_scholarship).permit(:first_name, :last_name, :email, :phone, :age, :reason, :career, :links, :accepted_terms)
  end
end
