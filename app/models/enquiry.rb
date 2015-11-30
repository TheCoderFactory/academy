class Enquiry < ActiveRecord::Base
  def send_emails
    EnquiryMailerJob.new.async.perform(self.id)
  end
end
