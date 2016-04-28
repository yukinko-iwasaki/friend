class TracksController < ApplicationController

  def new
     @track=Track.new
   end

  def create
    Track.create(track_params)
    redirect_to controller: 'users',action: 'show', id: current_user.id
  end



  private
  def track_params
    params.require(:track).permit(:quantity)
  end
end
