class AddDefaultValueToInSpreadsheetColumns < ActiveRecord::Migration
  def change
    change_column :enquiries, :in_spreadsheet, :boolean, default: false
    change_column :academy_applications, :in_spreadsheet, :boolean, default: false
    change_column :info_session_attendees, :in_spreadsheet, :boolean, default: false
    change_column :workshop_attendees, :in_spreadsheet, :boolean, default: false
  end
end
