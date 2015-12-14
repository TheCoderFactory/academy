class SubscribeToMailchimpJob
  include SuckerPunch::Job

  def perform(newsletter_user_id)
    newsletter_user = NewsletterUser.find(newsletter_user_id)
    uri = URI.parse('https://zapier.com/hooks/catch/3hn17j/')
    uri.newsletter_user = URI.encode_www_form(
      'email'       => newsletter_user.email,
      'first_name'  => newsletter_user.first_name,
      'last_name'   => newsletter_user.last_name,
    )
    uri.to_s
    open(uri)
  end
end

