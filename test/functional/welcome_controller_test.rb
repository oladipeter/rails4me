require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get start" do
    get :start
    assert_response :success
  end

end
