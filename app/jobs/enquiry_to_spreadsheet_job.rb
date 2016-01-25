  require "google/api_client"
  require "google_drive"

class EnquiryToSpreadsheetJob
  include SuckerPunch::Job

  def perform(enquiry_id)
    enquiry = Enquiry.find(enquiry_id)
    session = GoogleDrive.saved_session("config.json")

    ws = session.spreadsheet_by_key("17cWCumjPB44n6tEaWTzDTuVIyREoEhIeRGpiOx3302k").worksheets[0]
    start_row = 2
    index_row = ws.num_rows

    (1..ws.num_rows).each do |row|
      if ws[row, 1] == "CFA Enquiry"
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

    ws[start_row, 1] = "CFA Enquiry"
    ws[start_row, 2] = enquiry.created_at
    ws[start_row, 3] = enquiry.enquiry_type
    ws[start_row, 4] = enquiry.email
    ws[start_row, 5] = enquiry.first_name
    ws[start_row, 6] = enquiry.last_name
    ws[start_row, 7] = enquiry.phone
    ws[start_row, 8] = enquiry.message
    ws.save
  end
end
