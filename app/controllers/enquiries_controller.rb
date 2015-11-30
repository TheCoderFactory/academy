class EnquiriesController < ApplicationController
  def new
    @enquiry = Enquiry.new
  end

  def create
    @enquiry = Enquiry.new(enquiry_params)

    respond_to do |format|
      if @enquiry.save
        redirect_to "/confirmation", :enquiry
      else
        format.html { render :new }
      end
    end
  end

  private
    def enquiry_params
      params.require(:enquiry).permit(:first_name, :last_name, :phone, :email, :message)
    end
end
