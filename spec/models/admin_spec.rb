require 'rails_helper'

RSpec.describe Admin, :type => :model do

  before(:each) do
    @admin2 = FactoryGirl.create(:admin, name: 'giovanni',surname: 'astolfi', email: 'astolfi@gmail.com', password: 'foobar10', password_confirmation: 'foobar10' )
    @admin = FactoryGirl.create(:admin, name: 'giovanni',surname: 'lamberti', email: 'lamberti@gmail.com', password: 'foobar10', password_confirmation: 'foobar10' )
  end
    
  it "user should be valid" do
    expect(@admin).to be_valid
  end

  # Test of presence validation

  it "name should be present" do
    @admin.name = nil
    expect(@admin).not_to be_valid
  end 

  it "surname should be present" do
    @admin.surname = nil
    expect(@admin).not_to be_valid
  end

  it "email should be present" do
    @admin.email = nil
    expect(@admin).not_to be_valid
  end

  it "password should be present" do
    @admin.password = nil
    expect(@admin).not_to be_valid
  end

  # Test of length validation

  it "name should not be too long" do
    @admin.name = "a" * 51
    expect(@admin).not_to be_valid
  end

  it "surname should not be too long" do
    @admin.surname = "a" * 51
    expect(@admin).not_to be_valid
  end
  
  it "email should not be too long" do
    @admin.email = "a" * 31 + "@"+ "b" * 4 + ".it"
    expect(@admin).not_to be_valid
  end

  it "password should have a minimum length" do
    @admin.password = "a" * 7
    expect(@admin).not_to be_valid
  end

  # Test of format validation

  it "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @admin.email = invalid_address
      expect(@admin).not_to be_valid
    end
  end

  # Test of uniqueness validation

  it "email addresses should be unique" do
   @admin2.email = @admin.email
   expect(@admin2).not_to be_valid
  end

end
