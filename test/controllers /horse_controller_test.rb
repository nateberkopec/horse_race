require 'test_helper'

class HorsesControllerTest < ActionController::TestCase

  test "create should accept race code successfully" do
    assert_difference('Horse.count') do
      post :create, { horse: { name: 'Seattle Slew', race_code: 'XKRF'} }
    end
    assert_response :found
  end

end
