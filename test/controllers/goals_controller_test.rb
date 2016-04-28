require 'test_helper'

class GoalsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  def new
    @goal=Goal.new
  end

end
