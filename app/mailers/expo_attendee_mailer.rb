class ExpoAttendeeMailer < ApplicationMailer
  default from: "Coder Factory <info@coderfactory.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.academy_application_mailer.response.subject
  #
  def response(expo_attendee_id)
    @expo_attendee = ExpoAttendee.find(expo_attendee_id)
    mail(to: @expo_attendee.email, subject: "#{@expo_attendee.first_name} , you've entered the draw to win two free movie tickets.")
  end

end
