require "google/api_client"
require "google_drive"


class UpdateExpoSpreadsheetJob
  include SuckerPunch::Job

  def putInExpoSpreadsheet(item)
    in_item = item

    session = GoogleDrive.saved_session("config/config.json")
    ws = session.spreadsheet_by_key("1q1HToULtwI8SoUtArpj1fJR4nMjKB8P8CKIQq4hAMpg").worksheets[2]
    index_row = ws.num_rows+1

    ws[index_row, 2] = in_item.created_at.in_time_zone('Sydney').strftime("%m/%d/%y: %H:%M:%S %Z")
    ws[index_row, 3] = in_item.first_name
    ws[index_row, 4] = in_item.last_name
    ws[index_row, 5] = in_item.email
    ws[index_row, 6] = in_item.phone
    ws[index_row, 7] = in_item.expo_type
    ws.save
  end

  def perform
    @expo_attendees = ExpoAttendee.all

    @expo_attendees.each do |ea|
      if !ea.in_spreadsheet
        ea.update_attribute(:in_spreadsheet, putInExpoSpreadsheet(ea))
      end
    end
  end
end
