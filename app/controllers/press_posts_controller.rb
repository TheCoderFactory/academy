class PressPostsController < ApplicationController
  before_action :authenticate_user! , only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @press_posts = PressPost.all.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @press_post = PressPost.new
    respond_with(@press_post)
  end

  def create
    @press_post = PressPost.new(press_post_params)
    if @press_post.save
      redirect_to @press_post
    else
      respond_with(@press_post)
    end
  end

  def edit
    @press_post = PressPost.find(params[:id])
  end

  def update
    @press_post = PressPost.find(params[:id])
    if @press_post.update_attributes(press_post_params)
      redirect_to @press_post
    else
      repsond_with(@press_post)
    end
  end

  def destroy
    @press_post = PressPost.find(params[:id])
    @press_post.destroy
    redirect_to "/press_posts"
  end

  def show
    @press_post = PressPost.find(params[:id])
  end

  private
  def press_post_params
    params.require(:press_post).permit(:title, :lead, :content, :image, :publish, :published_date)
  end
end
