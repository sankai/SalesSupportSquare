require 'test_helper'

class BmnsControllerTest < ActionController::TestCase
  setup do
    @bmn = bmns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bmns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bmn" do
    assert_difference('Bmn.count') do
      post :create, bmn: { code: @bmn.code, name: @bmn.name }
    end

    assert_redirected_to bmn_path(assigns(:bmn))
  end

  test "should show bmn" do
    get :show, id: @bmn
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bmn
    assert_response :success
  end

  test "should update bmn" do
    patch :update, id: @bmn, bmn: { code: @bmn.code, name: @bmn.name }
    assert_redirected_to bmn_path(assigns(:bmn))
  end

  test "should destroy bmn" do
    assert_difference('Bmn.count', -1) do
      delete :destroy, id: @bmn
    end

    assert_redirected_to bmns_path
  end
end
