require 'rails_helper'

RSpec.describe Owner, :type => :model do

  before(:each) do
    @manager = FactoryGirl.create(:manager0)
    @product = FactoryGirl.create(:product0)
    @market = FactoryGirl.create(:market0,manager:@manager)
    @subject = FactoryGirl.create(:owner0,product:@product,market:@market)
  end

  it "owner should be valid" do
    expect(@subject).to be_valid
  end

  # Test of presence validation

  it "price should be present" do
    @subject.price = nil
    expect(@subject).not_to be_valid
  end 

  it "stock should be present" do
    @subject.stock = nil
    expect(@subject).not_to be_valid
  end 

  it "product_id should be present" do
    @subject.product_id = nil
    expect(@subject).not_to be_valid
  end 

  it "market_id should be present" do
    @subject.market_id = nil
    expect(@subject).not_to be_valid
  end 

  #testing association

  describe "Associations" do

    it "belongs to market" do
      assc = described_class.reflect_on_association(:market)
      expect(assc.macro).to eq :belongs_to
    end

    it "belongs to product" do
      assc = described_class.reflect_on_association(:product)
      expect(assc.macro).to eq :belongs_to
    end

  end

  

end
