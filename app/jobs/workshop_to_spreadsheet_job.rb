  require "google/api_client"
  require "google_drive"

class WorkshopToSpreadsheetJob
  include SuckerPunch::Job

  def perform(workshop_id)
    ActiveRecord::Base.connection_pool.with_connection do
      $mutex.synchronize {
        workshop = WorkshopAttendee.find(workshop_id)
        session = GoogleDrive.saved_session("config/config.json")

        ws = session.spreadsheet_by_key("1q1HToULtwI8SoUtArpj1fJR4nMjKB8P8CKIQq4hAMpg").worksheets[0]
        start_row = 2
        index_row = ws.num_rows

        (1..ws.num_rows).each do |row|
          if ws[row, 3] == "CFA Workshop Session"
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

        ws[start_row, 2] = workshop.created_at.in_time_zone('Sydney').strftime("%m/%d/%y: %H:%M:%S %Z")
        ws[start_row, 3] = "CFA Workshop Session"
        ws[start_row, 4] = workshop.session_date
        ws[start_row, 5] = workshop.first_name
        ws[start_row, 6] = workshop.last_name
        ws[start_row, 7] = workshop.email
        ws[start_row, 8] = workshop.phone
        ws.save
      }
    end
  end
end
