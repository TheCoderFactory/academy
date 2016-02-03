class InfoSessionAttendeesController < ApplicationController
  before_action :authenticate_user! , only: [:destroy]

  def new
    @info_session_attendee = InfoSessionAttendee.new
    @info_sessions = InfoSessionDate.all
    @info_session_dates = Array.new
    @info_sessions.each do |session|
      @info_session_dates << session.session_date if session.session_date.future?
    end
  end

  def create
    @info_session_attendee = InfoSessionAttendee.new(info_session_attendee_params)
    @info_session_attendee.info_session_date = InfoSessionDate.where(session_date: info_session_attendee_params[:session_date]).first
    if @info_session_attendee.save
      @info_session_attendee.send_emails
      redirect_to confirmation_path(type: 'info session registration')
    else
      redirect_to '/'
    end
  end

  def destroy
    @info_session_attendee = InfoSessionAttendee.find(params[:id])
    @info_session_attendee.destroy
    redirect_to request.referrer
  end

  private
  def info_session_attendee_params
    params.require(:info_session_attendee).permit(:first_name, :last_name, :phone, :email, :session_date)
  end
end
