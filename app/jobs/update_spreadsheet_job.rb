require "google/api_client"
require "google_drive"


class UpdateSpreadsheetJob
  include SuckerPunch::Job
  include FistOfFury::Recurrent

  recurs{daily.hour_of_day(9, 17)}

  def putInSpreadsheet(item)
    ident = ""
    in_item = item
    case in_item.class.name
    when "Enquiry"
      ident = "CFA Enquiry"
    when "AcademyApplication"
      ident = "Bootcamp Application"
    when "InfoSessionAttendee"
      ident = "Info Session"
    when "WorkshopAttendee"
      ident = "CFA Workshop Session"
    else
      return false
    end

    session = GoogleDrive.saved_session("config/config.json")
    ws = session.spreadsheet_by_key("1q1HToULtwI8SoUtArpj1fJR4nMjKB8P8CKIQq4hAMpg").worksheets[0]
    start_row = 2
    index_row = ws.num_rows

    (1..ws.num_rows).each do |row|
      if ws[row, 3] == ident
        start_row = row
        break
      end
    end

    while index_row >= start_row do
      (1..ws.num_cols).each do |col|
        ws[index_row+1, col] = ws[index_row, col]
        ws[index_row, col] = ""
      end
      index_row-=1
    end

    ws[start_row, 2] = in_item.created_at.in_time_zone('Sydney').strftime("%m/%d/%y: %H:%M:%S %Z")
    ws[start_row, 3] = ident
    case ident
    when "CFA Enquiry"
      ws[start_row, 4] = ""
      ws[start_row, 5] = in_item.first_name
      ws[start_row, 6] = in_item.last_name
      ws[start_row, 7] = in_item.email
      ws[start_row, 8] = in_item.phone
      ws[start_row, 9] = in_item.enquiry_type
    when "Bootcamp Application"
      ws[start_row, 4] = "March Intake"
      ws[start_row, 5] = in_item.first_name
      ws[start_row, 6] = in_item.last_name
      ws[start_row, 7] = in_item.email
      ws[start_row, 8] = in_item.phone
      ws[start_row, 10] = in_item.city + ", " + in_item.country
      ws[start_row, 12] = in_item.referral
    when "Info Session"
      ws[start_row, 4] = in_item.session_date
      ws[start_row, 5] = in_item.first_name
      ws[start_row, 6] = in_item.last_name
      ws[start_row, 7] = in_item.email
      ws[start_row, 8] = in_item.phone
    when "CFA Workshop Session"
      ws[start_row, 4] = in_item.session_date
      ws[start_row, 5] = in_item.first_name
      ws[start_row, 6] = in_item.last_name
      ws[start_row, 7] = in_item.email
      ws[start_row, 8] = in_item.phone
    else
      ws.reload
      ws.save
      return false
    end
    ws.save
    return true
  end

  def perform
    @enquiries = Enquiry.all
    @applications = AcademyApplication.all
    @info_session_attendees = InfoSessionAttendee.all
    @workshop_attendees = WorkshopAttendee.all

    @enquiries.each do |e|
      if !e.in_spreadsheet
        e.update_attribute(:in_spreadsheet, putInSpreadsheet(e))
      end
    end
    @applications.each do |a|
      if !a.in_spreadsheet
        a.update_attribute(:in_spreadsheet, putInSpreadsheet(a))
      end
    end
    @info_session_attendees.each do |is|
      if !is.in_spreadsheet
        is.update_attribute(:in_spreadsheet, putInSpreadsheet(is))
      end
    end
    @workshop_attendees.each do |ws|
      if !ws.in_spreadsheet
        ws.update_attribute(:in_spreadsheet, putInSpreadsheet(ws))
      end
    end
  end
end
