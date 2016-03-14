class CreateExpoAttendees < ActiveRecord::Migration
  def change
    create_table :expo_attendees do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone
      t.string :email

      t.timestamps null: false
    end
  end
end
