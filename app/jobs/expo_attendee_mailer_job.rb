class ExpoAttendeeMailerJob
  include SuckerPunch::Job

  def perform(expo_attende_id)
    ActiveRecord::Base.connection_pool.with_connection do
      ExpoAttendeeMailer.response(expo_attende_id).deliver_now
    end
  end
end
