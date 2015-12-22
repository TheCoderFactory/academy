class InfoSessionAttendeeMailerJob
  include SuckerPunch::Job

  def perform(attendee_id)
    ActiveRecord::Base.connection_pool.with_connection do
      InfoSessionAttendeeMailer.response(attendee_id).deliver_now
      InfoSessionAttendeeMailer.received(attendee_id).deliver_now
      #SubscribeToMailchimpJob.new.async.perform(academy_application_id)
    end
  end
end
