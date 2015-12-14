class PressController < ApplicationController
  def index
    @press_posts = PressPost.all.paginate(:page => params[:page], :per_page => 5)
  end
end
