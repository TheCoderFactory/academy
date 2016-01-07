class WomenInTechScholarshipMailer < ApplicationMailer
  default from: "Coder Factory Enquiries <info@coderfactory.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.women_in_tech_scholarship_mailer.response.subject
  #
  def response(women_in_tech_scholarship_id)
    @women_in_tech_scholarship = WomenInTechScholarship.find(women_in_tech_scholarship_id)
    mail(to: @women_in_tech_scholarship.email, subject: @women_in_tech_scholarship.first_name + ", your scholarship application has been received.")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.women_in_tech_scholarship_mailer.received.subject
  #
  def received(women_in_tech_scholarship_id)
    @women_in_tech_scholarship = WomenInTechScholarship.find(women_in_tech_scholarship_id)
    mail(to: "info@coderfactory.com", subject: "Women in Tech Scholarship application received.")
  end
end
