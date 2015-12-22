class CreateInfoSessionDates < ActiveRecord::Migration
  def change
    create_table :info_session_dates do |t|
      t.date :session_date

      t.timestamps null: false
    end
  end
end
