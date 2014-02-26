require 'test_helper'

class KkksControllerTest < ActionController::TestCase
  setup do
    @kkk = kkks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kkks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kkk" do
    assert_difference('Kkk.count') do
      post :create, kkk: { code: @kkk.code, name: @kkk.name }
    end

    assert_redirected_to kkk_path(assigns(:kkk))
  end

  test "should show kkk" do
    get :show, id: @kkk
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kkk
    assert_response :success
  end

  test "should update kkk" do
    patch :update, id: @kkk, kkk: { code: @kkk.code, name: @kkk.name }
    assert_redirected_to kkk_path(assigns(:kkk))
  end

  test "should destroy kkk" do
    assert_difference('Kkk.count', -1) do
      delete :destroy, id: @kkk
    end

    assert_redirected_to kkks_path
  end
end
