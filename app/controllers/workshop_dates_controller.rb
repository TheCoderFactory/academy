class WorkshopDatesController < ApplicationController
  before_action :authenticate_user! , only: [:index, :show, :create, :update, :destroy]

  def index
    @workshop_dates = WorkshopDate.all.paginate(:page => params[:page], :per_page => 5)
    @new_workshop_session = WorkshopDate.new
  end

  def show
    @workshop_date = WorkshopDate.find(params[:id])
    @workshop_date_attendees = @workshop_date.workshop_attendees.paginate(:page => params[:page], :per_page => 10)
  end

  def create
    @new_workshop_session = WorkshopDate.new(workshop_date_params)
    if @new_workshop_session.save
      redirect_to '/workshop_sessions'
    else
      redirect_to '/workshop_sessions'
    end
  end

  def update
    @workshop_date = WorkshopDate.find(params[:id])
    if @workshop_date.update_attributes(workshop_date_params)
      redirect_to '/workshop_sessions'
    else
      redirect_to '/workshop_sessions'
    end
  end

  def destroy
    @workshop_date = WorkshopDate.find(params[:id])
    @workshop_date.destroy
    redirect_to "/workshop_sessions"
  end

  private
  def workshop_date_params
    params.require(:workshop_date).permit(:session_date)
  end
end
