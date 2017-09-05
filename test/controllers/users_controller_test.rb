require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup 
    @user=User.create(name:"Claudio", surname:"Alicino", email:"cla@gmail.com", address:"via alessandro severo ,roma ,italia", 
                   yearofbirth: 1992, password: "foobar10", password_confirmation: "foobar10")
  end

  test "should get show" do
    get :show , id: @user.id
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

end
