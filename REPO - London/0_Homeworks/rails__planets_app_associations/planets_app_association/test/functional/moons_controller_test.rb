require 'test_helper'

class MoonsControllerTest < ActionController::TestCase
  setup do
    @moon = moons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moon" do
    assert_difference('Moon.count') do
      post :create, moon: { is_solid: @moon.is_solid, name: @moon.name, planet_id: @moon.planet_id }
    end

    assert_redirected_to moon_path(assigns(:moon))
  end

  test "should show moon" do
    get :show, id: @moon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moon
    assert_response :success
  end

  test "should update moon" do
    put :update, id: @moon, moon: { is_solid: @moon.is_solid, name: @moon.name, planet_id: @moon.planet_id }
    assert_redirected_to moon_path(assigns(:moon))
  end

  test "should destroy moon" do
    assert_difference('Moon.count', -1) do
      delete :destroy, id: @moon
    end

    assert_redirected_to moons_path
  end
end
