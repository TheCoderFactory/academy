class PagesController < ApplicationController
  def about
  end

  def community
  end

  def confirmation
    @type = params[:type]
  end

  def contact
    @enquiry = Enquiry.new
  end

  def curriculum
  end

  def faq
  end

  def instructors
  end

  def partners
  end

  def privacy
  end

  def scholarship
  end

  def testimonials
  end

  def vet_fee_help
  end

  def video_archive
  end

  def women_in_tech_scholarship
  end
end
