require 'rails_helper'

RSpec.describe Shopper, :type => :model do

  before(:each) do
    @user = FactoryGirl.create(:user0)
    @subject = FactoryGirl.create(:shopper0,user:@user)
  end

  it "shopper should be valid" do
    expect(@subject).to be_valid
  end

  # Test of presence validation

  it "user_id should be present" do
    @subject.user_id = nil
    expect(@subject).not_to be_valid
  end 

  #testing association

  describe "Associations" do

    it "has many requests" do
      assc = described_class.reflect_on_association(:requests)
      expect(assc.macro).to eq :has_many
    end

    it "belongs to user" do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end

  end



end

