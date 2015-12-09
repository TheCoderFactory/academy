class BlogController < ApplicationController
  def index
    @posts = Post.all.current_articles.paginate(:page => params[:page], :per_page => 5)
  end
end
