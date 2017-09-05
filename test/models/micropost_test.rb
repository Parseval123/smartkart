require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  
  def setup
    @market = Market.create(address:"Via Alessandro Severo ,Roma ,Italia", group:"Conad", info:"Orari di apertura")
    @user=User.create(name:"Claudio", surname:"Alicino", email:"cla@gmail.com", address:"Via Alessandro Severo ,Roma ,Italia", 
                   yearofbirth: 1992, password: "foobar10", password_confirmation: "foobar10")
    @micropost=Micropost.new(content:"Ciao Ciao", vote:3, user_id: @user.id, market_id: @market.id)
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "user_id should be present" do
    @micropost.user_id=nil
    assert_not @micropost.valid?
  end

  test "market_id should be present" do
    @micropost.market_id=nil
    assert_not @micropost.valid?
  end  

  test "content should be present" do
    @micropost.content = ""
    assert_not @micropost.valid?
  end

  test "vote should be present" do
    @micropost.vote = nil
    assert_not @micropost.valid?
  end

  test "content should not be too long" do
    @micropost.content = "a" * 141
    assert_not @micropost.valid?
  end

end
