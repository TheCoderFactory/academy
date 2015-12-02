class Enquiry < ActiveRecord::Base
  def send_emails
    EnquiryMailerJob.new.async.perform(self.id)
  end

  def self.reverse_order
    order(created_at: :desc)
  end
end
