class AcademyApplicationMailerJob
  include SuckerPunch::Job

  def perform(academy_application_id)
    ActiveRecord::Base.connection_pool.with_connection do
      AcademyApplicationMailer.response(academy_application_id).deliver_now
      AcademyApplicationMailer.received(academy_application_id).deliver_now
      #SubscribeToMailchimpJob.new.async.perform(academy_application_id)
    end
  end
end
