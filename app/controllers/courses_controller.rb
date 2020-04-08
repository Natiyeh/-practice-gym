class CoursesController < ApplicationController
  before_action :set_course, only: %i[show edit update destroy]
  before_action :admin?, only: %i[new create edit update destroy]

  def index
    @courses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.save

    redirect_to course_path(@course)
  end

  def edit
  end

  def update
    @course.update(course_params)

    redirect_to course_path(@course)
  end

  def destroy
    @course.destroy

    redirect_to courses_path
  end

  private

  def course_params
    params.require(:course).permit(:name, :description)
  end

  def set_course
    @course = Course.find(params[:id])
  end

  def admin?
    redirect_to root_path unless current_user.admin?
  end
end
