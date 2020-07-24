class Api::V1::DesksController < ApplicationController
    before_action :authorized, only: [:index, :create, :update]

  def index
    @desks = Desk.all
    render json: @desks
  end

  def create
    @desk = Course.new(full_params)
    if @desk.valid?
        @desk.save
        render json: { event: DeskSerializer.new(@desk)}
    else
        render json: { error: 'failed to create desk' }, status: :not_acceptable
    end
  end

  def show 
    @desk = Desk.find(params[:id])
    if @desk
      render json: @desk
    else 
      render json: { error: 'That course does not exist'}, status: :not_acceptable
    end
  end

  def update
    @desk = Desk.find(params[:id])
    @desk.update(desk_params)
    render json: @desk 
  end

  def destroy
    @desk = Desk.find(params[:id])
    if @desk 
      @desk.destroy 
      render json: {message: "Desk successfully deleted"}
    else 
      render json: {message: "Could not destroy desk"}, status: :not_acceptable
    end
  end
  

  private

  def desk_params
    params.require(:desk).permit(:student_name, :course_id)
  end
end
