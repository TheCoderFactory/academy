class EnquiriesController < ApplicationController
  before_action :authenticate_user! , only: [:index, :show, :destroy]

  def index
    @enquiries = Enquiry.all.reverse_order.paginate(:page => params[:page], :per_page => 1)
  end

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

  def show
    @enquiry = Enquiry.find(params[:id])
  end

  def destroy
    @enquiry = Enquiry.find(params[:id])
    @enquiry.destroy
    redirect_to '/enquiries'
  end

  private
  def enquiry_params
    params.require(:enquiry).permit(:first_name, :last_name, :phone, :email, :enquiry_type, :message)
  end
end
