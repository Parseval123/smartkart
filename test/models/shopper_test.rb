require 'test_helper'

class ShopperTest < ActiveSupport::TestCase
  

  def setup 
    @user =  @user=User.create(name:"Claudio", surname:"Alicino", email:"cla@gmail.com", address:"Via Alessandro Severo ,Roma ,Italia", 
                   yearofbirth: 1992, password: "foobar10", password_confirmation: "foobar10")
    @shopper = Shopper.new(user_id: @user.id)
  end

  test "should be valid" do
    assert @shopper.valid?
  end
  
  test "user_id should be present" do
    @shopper.user_id=nil
    assert_not @shopper.valid?
  end

end
