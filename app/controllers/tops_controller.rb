class TopsController < ApplicationController
   def index

    @goals = Goal.all
  end

  def show


    @user=Goal.find(params[:id]).users.limit(1)

  end
  

end
