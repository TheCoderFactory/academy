class SitemapController < ApplicationController
  def index
    @posts = Post.all
    @static_pages = [
      root_url,
      blog_url,
      about_coder_factory_academy_url,
      contact_url,
      privacy_url,
      academy_applications_url,
      women_in_tech_url,
      curriculum_url,
      about_coder_factory_academy_instructors_url,
      vet_fee_help_url,
      partners_url,
      testimonials_url
    ]
    headers['Content-Type'] = 'application/xml'
    respond_to do |format|
      format.xml
    end
  end
end
