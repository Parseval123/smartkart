require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get homepage" do
    get :homepage
    assert_response :success
  end

  test "should get howto" do
    get :howto
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

end
