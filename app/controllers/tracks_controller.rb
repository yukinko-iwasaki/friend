class TracksController < ApplicationController


  def create
    binding.pry
    Track.create(track_params)
    redirect_to action: :index

  end

  def index
    @tracks = Track.where(goal_id: params[:goal_id])
    @tracksum = Track.where(goal_id: params[:goal_id]).sum(:quantity)
  

  @aim = Goal.find(params[:goal_id])
  end



  private
  
  def track_params

   params.require(:track).permit(:quantity).merge(user_id: current_user.id).merge(goal_id: params[:goal_id])
  end
end
