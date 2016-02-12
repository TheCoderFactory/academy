class InSpreadsheet < ActiveRecord::Migration
  def change
    add_column :enquiries, :in_spreadsheet, :boolean
    add_column :academy_applications, :in_spreadsheet, :boolean
    add_column :info_session_attendees, :in_spreadsheet, :boolean
    add_column :workshop_attendees, :in_spreadsheet, :boolean
  end
end
