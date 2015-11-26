# Preview all emails at http://localhost:3000/rails/mailers/academy_application_mailer
class AcademyApplicationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/academy_application_mailer/response
  def response
    AcademyApplicationMailer.response
  end

  # Preview this email at http://localhost:3000/rails/mailers/academy_application_mailer/received
  def received
    AcademyApplicationMailer.received
  end

end
