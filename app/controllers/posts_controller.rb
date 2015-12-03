class PostsController < ApplicationController
  before_action :authenticate_user! , only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @posts = current_user.posts.published_in_reverse_chron_order.paginate(:page => params[:page], :per_page => 1)
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post
    else
      respond_with(@post)
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to @post
    else
      repsond_with(@post)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to "/posts"
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :lead, :content, :image, :publish, :published_date)
  end
end
