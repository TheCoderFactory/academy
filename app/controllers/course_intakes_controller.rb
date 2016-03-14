class CourseIntakesController < ApplicationController
  before_action :authenticate_user! , only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @course_intakes = CourseIntake.all.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @course_intake = CourseIntake.new
    respond_with(@course_intake)
  end

  def create
    @course_intake = CourseIntake.new(course_intake_params)
    if @course_intake.save
      redirect_to course_intakes_path
    else
      respond_with(@course_intake)
    end
  end

  def edit
    @course_intake = CourseIntake.find(params[:id])
  end

  def update
    @course_intake = CourseIntake.find(params[:id])
    if @course_intake.update_attributes(course_intake_params)
      redirect_to course_intakes_path
    else
      repsond_with(@course_intake)
    end
  end

  def destroy
    @course_intake = CourseIntake.find(params[:id])
    @course_intake.destroy
    redirect_to "/course_intakes"
  end

  private
  def course_intake_params
    params.require(:course_intake).permit(:start_date, :finish_date, :campus, :class_size, :allow_academy_applications, :allow_scholarship_applications)
  end
end
