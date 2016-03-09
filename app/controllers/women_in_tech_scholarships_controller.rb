class WomenInTechScholarshipsController < ApplicationController
  before_action :authenticate_user! , only: [:index, :show, :destroy]

  def index
    @women_in_tech_scholarships = WomenInTechScholarship.all.reverse_order.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @women_in_tech_scholarship = WomenInTechScholarship.find(params[:id])
  end

  def new
    @women_in_tech_scholarship = WomenInTechScholarship.new
    @course_intakes = CourseIntake.all
    @course_intakes_clean = Array.new
    @course_intakes.each do |ci|
      @course_intakes_clean << [(ci.start_date.strftime('%d %B %Y') + ", " + ci.campus), ci.id]
    end
  end

  def create
    @women_in_tech_scholarship = WomenInTechScholarship.new(women_in_tech_scholarship_params)
    if @women_in_tech_scholarship.save
      #@women_in_tech_scholarship.send_emails
      redirect_to controller: "pages", action: "confirmation", type: "scholarship application"
    else
      respond_with(@women_in_tech_scholarship)
    end

  end

  def destroy
    @women_in_tech_scholarship = WomenInTechScholarship.find(params[:id])
    @women_in_tech_scholarship.destroy
    redirect_to "/women_in_tech_scholarships"
  end

  private
  def women_in_tech_scholarship_params
    params.require(:women_in_tech_scholarship).permit(:first_name, :last_name, :email, :phone, :age, :reason, :career, :links, :accepted_terms, :portfolio, :course_intake_id)
  end
end
