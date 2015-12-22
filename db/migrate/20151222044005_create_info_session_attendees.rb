class CreateInfoSessionAttendees < ActiveRecord::Migration
  def change
    create_table :info_session_attendees do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.date :session_date
      t.belongs_to :info_session_date

      t.timestamps null: false
    end
  end
end
