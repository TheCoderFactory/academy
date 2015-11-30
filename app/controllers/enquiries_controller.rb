class EnquiriesController < ApplicationController
  def new
    @enquiry = Enquiry.new
    respond_with(@enquiry)
  end

  def create
    @enquiry = Enquiry.new(enquiry_params)
    if @enquiry.save
      @enquiry.send_emails
      redirect_to controller: "pages", action: "confirmation", type: "enquiry"
    else
      respond_with(@enquiry)
    end
  end

  private
  def enquiry_params
    params.require(:enquiry).permit(:first_name, :last_name, :phone, :email, :message)
  end
end
