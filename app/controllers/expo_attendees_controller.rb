class ExpoAttendeesController < ApplicationController
  before_action :authenticate_user! , only: [:index, :new, :create, :show, :destroy]

  def index
    @expo_attendees = ExpoAttendee.all.reverse_order.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @expo_attendee = ExpoAttendee.new
    respond_with(@expo_attendee)
  end

  def create
    @expo_attendee = ExpoAttendee.new(expo_attendee_params)
    if @expo_attendee.save
      @expo_attendee.send_emails
      redirect_to controller: "pages", action: "confirmation", type: "expo"
    else
      respond_with(@expo_attendee)
    end
  end

  def show
    @expo_attendee = ExpoAttendee.find(params[:id])
  end

  def destroy
    @expo_attendee = ExpoAttendee.find(params[:id])
    @expo_attendee.destroy
    redirect_to '/enquiries'
  end

  private
  def expo_attendee_params
    params.require(:expo_attendee).permit(:first_name, :last_name, :phone, :email, :expo_type)
  end
end
