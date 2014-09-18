require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get index_haml" do
    get :index_haml
    assert_response :success
  end

end
