class AcademyApplicationMailer < ApplicationMailer
  default from: "Coder Factory Enquiries <info@coderfactory.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.academy_application_mailer.response.subject
  #
  def response(academy_application_id)
    @academy_application = AcademyApplication.find(academy_application_id)
    mail(to: @academy_application.email, subject: @academy_application.first_name + ", your application has been received.")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.academy_application_mailer.received.subject
  #
  def received(academy_application_id)
    @academy_application = AcademyApplication.find(academy_application_id)
    mail(to: "info@coderfactory.com", subject: "Coder Factory Academy application received.")
  end
end
