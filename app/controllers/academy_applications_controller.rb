class AcademyApplicationsController < ApplicationController
  def new
    @academy_application = AcademyApplication.new
    respond_with(@academy_application)
  end

  def create
    @academy_application = AcademyApplication.new(academy_application_params)
    if @academy_application.save
      @academy_application.send_emails
      redirect_to controller: "pages", action: "confirmation", type: "application"
    else
      respond_with(@academy_application)
    end
  end

  private
  def academy_application_params
    params.require(:academy_application).permit(:first_name, :last_name, :city, :country, :email, :age, :gender, :one_line, :reason, :info, :passion, :experience, :challenge, :special, :links, :referral, :visa, :programme_choice)
  end
end
