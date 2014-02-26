require 'test_helper'

class UriysControllerTest < ActionController::TestCase
  setup do
    @uriy = uriys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:uriys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create uriy" do
    assert_difference('Uriy.count') do
      post :create, uriy: { amount: @uriy.amount, anken_id: @uriy.anken_id, month: @uriy.month, year: @uriy.year }
    end

    assert_redirected_to uriy_path(assigns(:uriy))
  end

  test "should show uriy" do
    get :show, id: @uriy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @uriy
    assert_response :success
  end

  test "should update uriy" do
    patch :update, id: @uriy, uriy: { amount: @uriy.amount, anken_id: @uriy.anken_id, month: @uriy.month, year: @uriy.year }
    assert_redirected_to uriy_path(assigns(:uriy))
  end

  test "should destroy uriy" do
    assert_difference('Uriy.count', -1) do
      delete :destroy, id: @uriy
    end

    assert_redirected_to uriys_path
  end
end
