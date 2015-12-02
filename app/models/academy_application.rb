class AcademyApplication < ActiveRecord::Base
  def send_emails
    AcademyApplicationMailerJob.new.async.perform(self.id)
  end

  def self.reverse_order
    order(created_at: :desc)
  end
end
