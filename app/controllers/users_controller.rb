class UsersController < ApplicationController
  def show
   @nickname=current_user.nickname
   @goals=Goal.where(user_id:current_user.id)
  end



end
