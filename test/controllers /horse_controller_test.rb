require 'test_helper'

class HorsesControllerTest < ActionController::TestCase

  test "create" do
    assert_difference('Horse.count') do
      post :create, { horse: { name: 'Seattle Slew' } }
    end
    assert_response :found
  end

end
