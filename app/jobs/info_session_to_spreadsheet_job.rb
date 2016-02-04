require "google/api_client"
require "google_drive"

class InfoSessionToSpreadsheetJob
  include SuckerPunch::Job

  def perform(info_session_id)
    ActiveRecord::Base.connection_pool.with_connection do
      $mutex.synchronize {
        info_session = InfoSessionAttendee.find(info_session_id)
        session = GoogleDrive.saved_session("config/config.json")

        ws = session.spreadsheet_by_key("1q1HToULtwI8SoUtArpj1fJR4nMjKB8P8CKIQq4hAMpg").worksheets[0]
        start_row = 2
        index_row = ws.num_rows

        (1..ws.num_rows).each do |row|
          if ws[row, 3] == "Info Session"
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

        ws[start_row, 2] = info_session.created_at.in_time_zone('Sydney').strftime("%m/%d/%y: %H:%M:%S %Z")
        ws[start_row, 3] = "Info Session"
        ws[start_row, 4] = info_session.session_date
        ws[start_row, 5] = info_session.first_name
        ws[start_row, 6] = info_session.last_name
        ws[start_row, 7] = info_session.email
        ws[start_row, 8] = info_session.phone
        ws.save
      }
    end
  end
end
