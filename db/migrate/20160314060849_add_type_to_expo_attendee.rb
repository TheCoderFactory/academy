class AddTypeToExpoAttendee < ActiveRecord::Migration
  def change
    add_column :expo_attendees, :expo_type, :string
  end
end
