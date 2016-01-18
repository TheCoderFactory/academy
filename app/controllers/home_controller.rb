class HomeController < ApplicationController
  def index
    @info_session_attendee = InfoSessionAttendee.new
    @info_sessions = InfoSessionDate.all
    @info_session_dates = Array.new
    @info_sessions.each do |session|
      @info_session_dates << session.session_date
    end
    @workshop_session_attendee = WorkshopAttendee.new
    @workshop_sessions = WorkshopDate.all
    @workshop_session_dates = Array.new
    @workshop_sessions.each do |session|
      @workshop_session_dates << session.session_date
    end
  end
end
