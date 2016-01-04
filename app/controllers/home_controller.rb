class HomeController < ApplicationController
  def index
    @info_session_attendee = InfoSessionAttendee.new
    @info_sessions = InfoSessionDate.all
    @info_session_dates = Array.new
    @info_sessions.each do |session|
      @info_session_dates << session.session_date.strftime('%d %B %Y')
    end
  end
end
