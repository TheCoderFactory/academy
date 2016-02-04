class InfoSessionAttendee < ActiveRecord::Base
  belongs_to :info_session_date

  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :session_date, presence: true
  validates :email, presence: true, :format => EMAIL_REGEX

  def send_emails
    InfoSessionAttendeeMailerJob.new.async.perform(self.id)
  end

  def update_spreadsheet
    InfoSessionToSpreadsheetJob.new.async.perform(self.id)
  end
end
