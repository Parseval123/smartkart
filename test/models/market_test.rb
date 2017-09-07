require 'test_helper'

class MarketTest < ActiveSupport::TestCase
  
  def setup
    @market = Market.create(address:"Via Alessandro Severo ,Roma ,Italia", group:"Conad", info:"Orari di apertura")  
  end

  test "should be valid" do
    assert @market.valid?
  end

  test "address should be present" do
    @market.address = ""
    assert_not @market.valid?
  end

  test "group should be present" do
    @market.group = ""
    assert_not @market.valid?
  end

  test "info should be present" do
    @market.info = ""
    assert_not @market.valid?
  end

  #test "manager_id should be present" do
    #@market.manager_id=nil
    #assert_not @market.valid?
  #end

  test "address should not be too long" do
    @market.address = "a" * 61
    assert_not @market.valid?
  end

  test "group should not be too long" do
    @market.group = "a" *16 
    assert_not @market.valid?
  end

  test "info should not be too long" do
    @market.info = "a" * 101
    assert_not @market.valid?
  end

  test "address validation should accept valid addresses" do
    valid_addresses = ["via alessandro severo ,roma ,italia","via paolo paruta ,roma ,italia"]
    valid_addresses.each do |valid_address|
      @market.address = valid_address
      assert @market.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "address validation should reject invalid addresses" do
    invalid_addresses = ["via alessandro severo .roma ,italia","via paolo paruta .roma .italia"]
    invalid_addresses.each do |invalid_address|
      @market.address = invalid_address
      assert_not @market.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

end
