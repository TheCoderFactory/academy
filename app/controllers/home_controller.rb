class HomeController < ApplicationController
  def index
    @newsletter_user = NewsletterUser.new
  end
end
