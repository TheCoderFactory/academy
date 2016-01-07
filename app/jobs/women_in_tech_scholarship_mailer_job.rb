class WomenInTechScholarshipMailerJob
  include SuckerPunch::Job

  def perform(women_in_tech_scholarship_id)
    ActiveRecord::Base.connection_pool.with_connection do
      WomenInTechScholarshipMailer.response(women_in_tech_scholarship_id).deliver_now
      WomenInTechScholarshipMailer.received(women_in_tech_scholarship_id).deliver_now
      #SubscribeToMailchimpJob.new.async.perform(women_in_tech_scholarship_id)
    end
  end
end
