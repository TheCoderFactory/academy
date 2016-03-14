class ExpoAttendee < ActiveRecord::Base
  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :first_name, presence: true
  validates :email, presence: true, :format => EMAIL_REGEX
  validates :phone, presence: true

  def send_emails
    ExpoAttendeeMailerJob.perform_async(self.id)
  end
end
