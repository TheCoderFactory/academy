class CreateWorkshopDates < ActiveRecord::Migration
  def change
    create_table :workshop_dates do |t|
      t.date :session_date

      t.timestamps null: false
    end
  end
end
