require 'rails_helper'

RSpec.describe User, :type => :model do

  before(:each) do
    @subject2 = FactoryGirl.create(:user2)
    @subject = FactoryGirl.create(:user3)
  end
    
  it "user should be valid" do
    expect(@subject).to be_valid
  end

  # Test of presence validation

  it "name should be present" do
    @subject.name = nil
    expect(@subject).not_to be_valid
  end 

  it "surname should be present" do
    @subject.surname = nil
    expect(@subject).not_to be_valid
  end

  it "address should be present" do
    @subject.address = nil
    expect(@subject).not_to be_valid
  end

  it "email should be present" do
    @subject.email = nil
    expect(@subject).not_to be_valid
  end

  it "yearofbirth should be present" do
    @subject.yearofbirth = nil
    expect(@subject).not_to be_valid
  end

  it "password should be present" do
    @subject.password = nil
    expect(@subject).not_to be_valid
  end

  # Test of length validation

  it "name should not be too long" do
    @subject.name = "a" * 51
    expect(@subject).not_to be_valid
  end

  it "surname should not be too long" do
    @subject.surname = "a" * 51
    expect(@subject).not_to be_valid
  end

  it "address should not be too long" do
    @subject.surname = "a" * 47 + " ,Roma ,Italia"
    expect(@subject).not_to be_valid
  end
  
  it "email should not be too long" do
    @subject.email = "a" * 31 + "@"+ "b" * 4 + ".it"
    expect(@subject).not_to be_valid
  end

  it "password should have a minimum length" do
    @subject.password = "a" * 7
    expect(@subject).not_to be_valid
  end

  # Test of format validation

  it "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @subject.email = invalid_address
      expect(@subject).not_to be_valid
    end
  end

  it "address validation should reject invalid addresses" do
    invalid_addresses = ["via alessandro severo .roma ,italia","via paolo paruta .roma .italia"]
    invalid_addresses.each do |invalid_address|
      @subject.address = invalid_address
      expect(@subject).not_to be_valid
    end
  end

  # Test of uniqueness validation

  it "email addresses should be unique" do
   @subject2.email = @subject.email
   expect(@subject2).not_to be_valid
  end
  
  #testing association

  describe "Associations" do

  it "has many shoppers" do
    assc = described_class.reflect_on_association(:shoppers)
    expect(assc.macro).to eq :has_many
  end

  it "has many micropost" do
    assc = described_class.reflect_on_association(:microposts)
    expect(assc.macro).to eq :has_many
  end

  end

end
