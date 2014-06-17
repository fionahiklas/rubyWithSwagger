require 'test_helper'

class HelpControllerTest < ActionController::TestCase
  test "should get help" do
    get :help
    assert_response :success
  end

  test "should get status" do
    get :status
    assert_response :success
  end

  test "should get identify" do
    get :identify
    assert_response :success
  end

  test "should get echo" do
    get :echo
    assert_response :success
  end

end
