class AddSpreadsheetColumnToExpoAttendees < ActiveRecord::Migration
  def change
    add_column :expo_attendees, :in_spreadsheet, :boolean, default: false
  end
end
