require 'test_helper'

class ManagerTest < ActiveSupport::TestCase
  def setup 
    @manager=Manager.create(name:"Mario", surname:"Rossi", email:"m.rossi@gmail.com", tel:"3345678952", curriculum: "bla bla bla", 
                   yearofbirth: 1960, password: "foobar10", password_confirmation: "foobar10")
  end

  test "should be valid" do
    assert @manager.valid?
  end

  test "name should be present" do
    @manager.name = ""
    assert_not @manager.valid?
  end

  test "surname should be present" do
    @manager.surname = ""
    assert_not @manager.valid?
  end

  test "email should be present" do
    @manager.email = "     "
    assert_not @manager.valid?
  end

  test "tel should be present" do
    @manager.tel = "     "
    assert_not @manager.valid?
  end

  test "yearofbirth should be present" do
    @manager.yearofbirth = nil
    assert_not @manager.valid?
  end

  test "curriculum should be present" do
    @manager.curriculum = ""
    assert_not @manager.valid?
  end

  test "password should be present" do
    @manager.password = "  "
    assert_not @manager.valid?
  end

  test "name should not be too long" do
    @manager.name = "a" * 51
    assert_not @manager.valid?
  end

  test "surname should not be too long" do
    @manager.surname = "a" * 51
    assert_not @manager.valid?
  end

  test "email should not be too long" do
    @manager.email = "a" * 21 + "@gmail.com"
    assert_not @manager.valid?
  end

  test "curriculum should not be too long" do
    @manager.curriculum = "a" * 301
    assert_not @manager.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @manager.email = valid_address
      assert @manager.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @manager.email = invalid_address
      assert_not @manager.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "tel validation should accept valid addresses" do
    valid_addresses = ["3356948253","067852123"]
    valid_addresses.each do |valid_address|
      @manager.tel = valid_address
      assert @manager.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "tel validation should reject invalid addresses" do
    invalid_addresses = ["65tr8902","789","ggkjbkjf","76533252778"]
    invalid_addresses.each do |invalid_address|
      @manager.tel = invalid_address
      assert_not @manager.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_manager = @manager.dup
    duplicate_manager.email = @manager.email.upcase
    @manager.save
    assert_not duplicate_manager.valid?
  end

  test "password should have a minimum length" do
    @manager.password = @manager.password_confirmation = "a" * 7 
    assert_not @manager.valid?
  end

  

  
  

end
