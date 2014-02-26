require 'test_helper'

class UribunyasControllerTest < ActionController::TestCase
  setup do
    @uribunya = uribunyas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:uribunyas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create uribunya" do
    assert_difference('Uribunya.count') do
      post :create, uribunya: { code: @uribunya.code, name: @uribunya.name }
    end

    assert_redirected_to uribunya_path(assigns(:uribunya))
  end

  test "should show uribunya" do
    get :show, id: @uribunya
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @uribunya
    assert_response :success
  end

  test "should update uribunya" do
    patch :update, id: @uribunya, uribunya: { code: @uribunya.code, name: @uribunya.name }
    assert_redirected_to uribunya_path(assigns(:uribunya))
  end

  test "should destroy uribunya" do
    assert_difference('Uribunya.count', -1) do
      delete :destroy, id: @uribunya
    end

    assert_redirected_to uribunyas_path
  end
end
