class InfoSessionAttendeesController < ApplicationController
  def create
    @info_session_attendee = InfoSessionAttendee.new(info_session_attendee_params)
    @info_session_attendee.info_session_date = InfoSessionDate.where(session_date: info_session_attendee_params[:session_date]).first
    if @info_session_attendee.save
      @info_session_attendee.send_emails
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  private
  def info_session_attendee_params
    params.require(:info_session_attendee).permit(:first_name, :last_name, :phone, :email, :session_date)
  end
end
