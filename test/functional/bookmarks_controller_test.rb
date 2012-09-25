require 'test_helper'

class BookmarksControllerTest < ActionController::TestCase
  test "should get variable" do
    get :variable
    assert_response :success
  end

end
