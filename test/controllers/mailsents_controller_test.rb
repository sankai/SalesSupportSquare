require 'test_helper'

class MailsentsControllerTest < ActionController::TestCase
  setup do
    @mailsent = mailsents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mailsents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mailsent" do
    assert_difference('Mailsent.count') do
      post :create, mailsent: { mailtemplate_id: @mailsent.mailtemplate_id, sent_time: @mailsent.sent_time }
    end

    assert_redirected_to mailsent_path(assigns(:mailsent))
  end

  test "should show mailsent" do
    get :show, id: @mailsent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mailsent
    assert_response :success
  end

  test "should update mailsent" do
    patch :update, id: @mailsent, mailsent: { mailtemplate_id: @mailsent.mailtemplate_id, sent_time: @mailsent.sent_time }
    assert_redirected_to mailsent_path(assigns(:mailsent))
  end

  test "should destroy mailsent" do
    assert_difference('Mailsent.count', -1) do
      delete :destroy, id: @mailsent
    end

    assert_redirected_to mailsents_path
  end
end
