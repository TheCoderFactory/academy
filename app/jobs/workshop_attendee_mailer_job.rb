class WorkshopAttendeeMailerJob
  include SuckerPunch::Job

  def perform(attendee_id)
    ActiveRecord::Base.connection_pool.with_connection do
      WorkshopAttendeeMailer.response(attendee_id).deliver_now
      WorkshopAttendeeMailer.received(attendee_id).deliver_now
      #SubscribeToMailchimpJob.new.async.perform(academy_application_id)
    end
  end
end
