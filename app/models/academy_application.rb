class AcademyApplication < ActiveRecord::Base
  def send_emails
        AcademyApplicationMailerJob.new.async.perform(self.id)
  end
end
