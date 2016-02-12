class AcademyApplication < ActiveRecord::Base
  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :first_name, :last_name, presence: true
  validates :city, presence: true
  validates :email, presence: true, :format => EMAIL_REGEX
  validates :age, presence: true
  validates :one_line, :reason, :info, :passion, :experience, :challenge, :special, presence: true
  validates :referral, length: { maximum: 200 }

  def send_emails
    AcademyApplicationMailerJob.perform_async(self.id)
  end

  def self.reverse_order
    order(created_at: :desc)
  end
end
