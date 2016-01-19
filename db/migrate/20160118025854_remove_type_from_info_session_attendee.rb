class RemoveTypeFromInfoSessionAttendee < ActiveRecord::Migration
  def change
    remove_column :info_session_attendees, :session_type
  end
end
