class AddTypeToInfoSession < ActiveRecord::Migration
  def change
    add_column :info_session_attendees, :session_type, :string
  end
end
