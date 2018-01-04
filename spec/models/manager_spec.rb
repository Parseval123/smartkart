require 'rails_helper'

RSpec.describe Manager, :type => :model do

  before(:each) do
    @subject = FactoryGirl.create(:manager0)
    @subject2 = FactoryGirl.create(:manager1)
  end

  it "manager should be valid" do
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

  it "email should be present" do
    @subject.email = nil
    expect(@subject).not_to be_valid
  end

  it "tel should be present" do
    @subject.tel = nil
    expect(@subject).not_to be_valid
  end

  it "yearofbirth should be present" do
    @subject.yearofbirth = nil
    expect(@subject).not_to be_valid
  end

  it "curriculum should be present" do
    @subject.curriculum = nil
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

  it "email should not be too long" do
    @subject.email = "a" * 31 + "@"+ "b" * 4 + ".it"
    expect(@subject).not_to be_valid
  end

  it "curriculum should not be too long" do
    @subject.curriculum = "a" * 301 
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

  it "tel validation should reject invalid addresses" do
    invalid_addresses = ["65tr8902","789","ggkjbkjf","76533252778"]
    invalid_addresses.each do |invalid_address|
      @subject.tel = invalid_address
      expect(@subject).not_to be_valid
    end
  end

  # Test of uniqueness validation

  it "email addresses should be unique" do
   @subject2.email = @subject.email
   expect(@subject2).not_to be_valid
  end

  # Test of inclusion validation

  #it "yearofbirth age should be included in the range" do
    #@subject.yearofbirth = 1929
    #if @subject.yearofbirth < 1930 || @subject.yearofbirth > 2000
      #expect(@subject).not_to be_valid
    #else
      #expect(@subject).to be_valid
    #end 
  #end

  #testing association

  describe "Associations" do

    it "belongs to market" do
      assc = described_class.reflect_on_association(:market)
      expect(assc.macro).to eq :belongs_to
    end

  end

end
