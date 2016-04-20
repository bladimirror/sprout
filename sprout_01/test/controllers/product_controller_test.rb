require 'test_helper'

class ProductControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new_product" do
    get :new_product
    assert_response :success
  end

  test "should get show_product" do
    get :show_product
    assert_response :success
  end

  test "should get update_product" do
    get :update_product
    assert_response :success
  end

  test "should get delete_product" do
    get :delete_product
    assert_response :success
  end

end
