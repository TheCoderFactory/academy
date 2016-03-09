class WomenInTechScholarship < ActiveRecord::Base
  mount_uploader :portfolio, PortfolioUploader

  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, :format => EMAIL_REGEX
  validates :age, :phone, presence: true
  validates :reason, :career, presence: true
  validates :accepted_terms, presence: true

  belongs_to :course_intake

  def send_emails
    WomenInTechScholarshipMailerJob.perform_async(self.id)
  end

  def self.reverse_order
    order(created_at: :desc)
  end
end
