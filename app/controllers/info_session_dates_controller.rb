class InfoSessionDatesController < ApplicationController
  before_action :authenticate_user! , only: [:index, :show, :create, :update, :destroy]

  def index
    @info_session_dates = InfoSessionDate.all.paginate(:page => params[:page], :per_page => 5)
    @new_info_session = InfoSessionDate.new
  end

  def show
    @info_session_date = InfoSessionDate.find(params[:id])
    @info_session_attendees = @info_session_date.info_session_attendees.paginate(:page => params[:page], :per_page => 10)
  end

  def create
    @new_info_session = InfoSessionDate.new(info_session_date_params)
    if @new_info_session.save
      redirect_to '/information-sessions'
    else
      redirect_to '/information-sessions'
    end
  end

  def update
    @info_session_date = InfoSessionDate.find(params[:id])
    if @info_session_date.update_attributes(post_params)
      redirect_to '/information-sessions'
    else
      redirect_to '/information-sessions'
    end
  end

  def destroy
    @info_session_date = InfoSessionDate.find(params[:id])
    @info_session_date.destroy
    redirect_to "/information-sessions"
  end

  private
  def info_session_date_params
    params.require(:info_session_date).permit(:session_date)
  end
end
