require 'test_helper'

class PlanetsControllerTest < ActionController::TestCase
  setup do
    @planet = planets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:planets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create planet" do
    assert_difference('Planet.count') do
      post :create, planet: { diameter: @planet.diameter, galaxy_id: @planet.galaxy_id, image: @planet.image, mass: @planet.mass, name: @planet.name, orbit: @planet.orbit }
    end

    assert_redirected_to planet_path(assigns(:planet))
  end

  test "should show planet" do
    get :show, id: @planet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @planet
    assert_response :success
  end

  test "should update planet" do
    put :update, id: @planet, planet: { diameter: @planet.diameter, galaxy_id: @planet.galaxy_id, image: @planet.image, mass: @planet.mass, name: @planet.name, orbit: @planet.orbit }
    assert_redirected_to planet_path(assigns(:planet))
  end

  test "should destroy planet" do
    assert_difference('Planet.count', -1) do
      delete :destroy, id: @planet
    end

    assert_redirected_to planets_path
  end
end
