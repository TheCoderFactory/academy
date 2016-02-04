class SpreadsheetAllController < ApplicationController

  def run
    @enquires = Enquiry.all
    @applications = AcademyApplication.all
    @info_sessions = InfoSessionAttendee.all
    @workshop_sessions = WorkshopAttendee.all

    @enquires.each do |e|
      e.update_spreadsheet
    end
    @applications.each do |a|
      a.update_spreadsheet
    end
    @info_sessions.each do |is|
      is.update_spreadsheet
    end
    @workshop_sessions.each do |ws|
      ws.update_spreadsheet
    end
  end
end
