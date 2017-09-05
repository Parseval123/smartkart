require 'test_helper'

class RequestTest < ActiveSupport::TestCase

  def setup
    @product=Product.create(name:"Pasta", label:"Barilla", package:"500 g")
    @user=User.create(name:"Claudio", surname:"Alicino", email:"cla@gmail.com", address:"Via Alessandro Severo ,Roma ,Italia", 
                   yearofbirth: 1992, password: "foobar10", password_confirmation: "foobar10")
    @shopper = Shopper.create(user_id: @user.id)
    @request = Request.new(shopper_id: @shopper.id, product_id: @product.id)
  end

  test "should be valid" do
    assert @request.valid?
  end

  test "shopper_id should be present" do
    @request.shopper_id=nil
    assert_not @request.valid?
  end

  test "product_id should be present" do
    @request.product_id=nil
    assert_not @request.valid?
  end
  
end
