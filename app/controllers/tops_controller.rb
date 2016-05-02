class TopsController < ApplicationController
   def index

    @goals = Goal.all
  end

  def show
  
    @goal=Goal.find(params[:id])

    @user=Goal.find(params[:id]).users.limit(1)

  end
  

end
