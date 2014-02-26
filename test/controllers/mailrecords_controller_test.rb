require 'test_helper'

class MailrecordsControllerTest < ActionController::TestCase
  setup do
    @mailrecord = mailrecords(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mailrecords)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mailrecord" do
    assert_difference('Mailrecord.count') do
      post :create, mailrecord: { mailsent_id: @mailrecord.mailsent_id, shain_id: @mailrecord.shain_id }
    end

    assert_redirected_to mailrecord_path(assigns(:mailrecord))
  end

  test "should show mailrecord" do
    get :show, id: @mailrecord
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mailrecord
    assert_response :success
  end

  test "should update mailrecord" do
    patch :update, id: @mailrecord, mailrecord: { mailsent_id: @mailrecord.mailsent_id, shain_id: @mailrecord.shain_id }
    assert_redirected_to mailrecord_path(assigns(:mailrecord))
  end

  test "should destroy mailrecord" do
    assert_difference('Mailrecord.count', -1) do
      delete :destroy, id: @mailrecord
    end

    assert_redirected_to mailrecords_path
  end
end
