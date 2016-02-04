class InfoSessionAttendeeMailer < ApplicationMailer
  default from: "Coder Factory Enquiries <info@coderfactory.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.academy_application_mailer.response.subject
  #
  def response(attendee_id)
    @attendee = InfoSessionAttendee.find(attendee_id)
    mail(to: @attendee.email, subject: @attendee.first_name + ", you are now registered with our info sessions.")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.academy_application_mailer.received.subject
  #
  def received(attendee_id)
    @attendee = InfoSessionAttendee.find(attendee_id)
    mail(to: "info@coderfactory.com", from: "Info Session Registration <info@coderfactory.com>", subject: "Coder Factory Academy info session registration received.")
  end
end
