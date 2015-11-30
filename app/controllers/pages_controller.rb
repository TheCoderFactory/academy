class PagesController < ApplicationController
  def faq
  end

  def curriculum
  end

  def about
  end

  def contact
    @enquiry = Enquiry.new
  end

  def confirmation
    @type = params[:type]
  end

  def privacy
  end

  def community
  end
end
