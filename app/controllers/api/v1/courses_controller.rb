class Api::V1::CoursesController < ApplicationController
    before_action :authorized, only: [:index, :create, :update]

  def index
    @courses = Course.all
    render json: @courses
  end

  def create
    @course = Course.new(full_params)
    if @course.valid?
        @course.save
        render json: { event: CourseSerializer.new(@course)}
    else
        render json: { error: 'failed to create course' }, status: :not_acceptable
    end
  end

  def show 
    @course = Course.find(params[:id])
    if @course
      render json: @course
    else 
      render json: { error: 'That course does not exist'}, status: :not_acceptable
    end
  end

  def update
    @course = Course.find(params[:id])
    @course.update(course_params)
    render json: @course 
  end

  def destroy
    @course = Course.find(params[:id])
    if @course 
      @course.destroy 
      render json: {message: "Course successfully deleted"}
    else 
      render json: {message: "Could not destroy course"}, status: :not_acceptable
    end
  end
  

  private

  def course_params
    params.require(:course).permit(:title, :user_id)
  end

end
