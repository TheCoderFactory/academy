class PostsController < ApplicationController
  before_action :authenticate_user! , only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @posts = current_user.posts.paginate(:page => params[:page], :per_page => 10)
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
    @post = Post.friendly.find(params[:id])
  end

  def update
    @post = Post.friendly.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to @post
    else
      repsond_with(@post)
    end
  end

  def destroy
    @post = Post.friendly.find(params[:id])
    @post.destroy
    redirect_to "/posts"
  end

  def show
    @post = Post.friendly.find(params[:id])
    @info_sessions = InfoSessionDate.all
    @info_session_dates = Array.new
    @info_sessions.each do |session|
      @info_session_dates << session.session_date.strftime('%d %B %Y') if session.session_date.future?
    end
    @info_session_dates.sort! { |a,b|  DateTime.parse(a) <=> DateTime.parse(b) }
    @info_session_date = Array.new
    @info_session_date << @info_session_dates.first
  end

  private
  def post_params
    params.require(:post).permit(:title, :lead, :content, :image, :publish, :published_date)
  end
end
