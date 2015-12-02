class BlogController < ApplicationController
  def index
    @posts = Post.all.published_in_reverse_chron_order.paginate(:page => params[:page], :per_page => 1)
  end
end
