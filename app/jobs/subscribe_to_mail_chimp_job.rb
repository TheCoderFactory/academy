class SubscribeToMailchimpJob
  include SuckerPunch::Job

  def perform(academy_application_id)
    academyApplication = AcademyApplication.find(academy_application_id)
    uri = URI.parse('https://zapier.com/hooks/catch/3hn17j/')
    uri.academyApplication = URI.encode_www_form(
      'email'       => academyApplication.email,
      'first_name'  => academyApplication.first_name,
      'last_name'   => academyApplication.last_name,
    )
    uri.to_s
    open(uri)
    if enquiry.enquiry_type.important
      PushToHubspotJob.new.async.perform(self.id)
    end
  end
end

