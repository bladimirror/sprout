require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new_user" do
    get :new_user
    assert_response :success
  end

  test "should get show_user" do
    get :show_user
    assert_response :success
  end

  test "should get update_user" do
    get :update_user
    assert_response :success
  end

  test "should get delete_user" do
    get :delete_user
    assert_response :success
  end

end
