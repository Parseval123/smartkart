require 'rails_helper'

RSpec.describe Micropost, :type => :model do

  before(:each) do
    @user = FactoryGirl.create(:user0)
    @market = FactoryGirl.create(:market0, manager:nil)
    @subject = FactoryGirl.create(:micropost0,user:@user,market:@market)
  end

  it "micropost should be valid" do
    expect(@subject).to be_valid
  end

  # Test of presence validation

  it "content should be present" do
    @subject.content = nil
    expect(@subject).not_to be_valid
  end 

  it "vote should be present" do
    @subject.vote = nil
    expect(@subject).not_to be_valid
  end 

  it "user_id should be present" do
    @subject.user_id = nil
    expect(@subject).not_to be_valid
  end 

  it "market_id should be present" do
    @subject.market_id = nil
    expect(@subject).not_to be_valid
  end 

  # Test of length validation

  it "content should not be too long" do
    @subject.content = "a" * 141
    expect(@subject).not_to be_valid
  end

  # Test of inclusion validation


  #testing association

  describe "Associations" do

    it "belongs to market" do
      assc = described_class.reflect_on_association(:market)
      expect(assc.macro).to eq :belongs_to
    end

    it "belongs to user" do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end

  end
  



end
