class WorkshopAttendeesController < ApplicationController
  before_action :authenticate_user! , only: [:destroy]

  def create
    @workshop_session_attendee = WorkshopAttendee.new(workshop_session_attendee_params)
    @workshop_session_attendee.workshop_date = WorkshopDate.where(session_date: workshop_session_attendee_params[:session_date]).first
    if @workshop_session_attendee.save
      @workshop_session_attendee.send_emails
      redirect_to confirmation_path(type: 'registration')
    else
      redirect_to '/'
    end
  end

  def destroy
    @workshop_session_attendee = WorkshopAttendee.find(params[:id])
    @workshop_session_attendee.destroy
    redirect_to request.referrer
  end

  private
  def workshop_session_attendee_params
    params.require(:workshop_session_attendee).permit(:first_name, :last_name, :phone, :email, :session_date, :session_type)
  end
end