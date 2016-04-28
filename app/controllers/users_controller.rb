class UsersController < ApplicationController
  def show
   @nickname=current_user.nickname
   @goals=Goal.where(user_id:current_user.id)
  end

  def progress
  
  @tracks=Goal.where(id: goal_id).tracks
  @tracks.each do |track|
  @progress+= track
  end


end

end
