require 'test_helper'

class UrijsControllerTest < ActionController::TestCase
  setup do
    @urij = urijs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:urijs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create urij" do
    assert_difference('Urij.count') do
      post :create, urij: { amount: @urij.amount, anken_id: @urij.anken_id, month: @urij.month, year: @urij.year }
    end

    assert_redirected_to urij_path(assigns(:urij))
  end

  test "should show urij" do
    get :show, id: @urij
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @urij
    assert_response :success
  end

  test "should update urij" do
    patch :update, id: @urij, urij: { amount: @urij.amount, anken_id: @urij.anken_id, month: @urij.month, year: @urij.year }
    assert_redirected_to urij_path(assigns(:urij))
  end

  test "should destroy urij" do
    assert_difference('Urij.count', -1) do
      delete :destroy, id: @urij
    end

    assert_redirected_to urijs_path
  end
end
