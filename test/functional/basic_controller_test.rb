require 'test_helper'

class BasicControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get gallery_tags" do
    get :gallery_tags
    assert_response :success
  end

end
