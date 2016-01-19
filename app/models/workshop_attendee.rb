class WorkshopAttendee < ActiveRecord::Base
  belongs_to :workshop_date

  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :session_date, presence: true
  validates :email, presence: true, :format => EMAIL_REGEX

  def send_emails
    WorkshopAttendeeMailerJob.new.async.perform(self.id)
  end
end
