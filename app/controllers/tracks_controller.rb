class TracksController < ApplicationController

  def new
     @track=Track.new
     @goal=Goal.find(params[:goal_id])

   end

  def create
    Track.create(track_params)
    redirect_to controller: 'users',action: 'show', id: current_user.id
  end



  private
  def track_params
    @goal=Goal.where(user_id:current_user.id)
    params.require(:track).permit(:quantity).merge(goal_id:params[:goal_id]).merge(user_id:current_user.id)
  end
end
