require 'rails_helper'

RSpec.describe Request, :type => :model do

  before(:each) do
    @user = FactoryGirl.create(:user0)
    @shopper = FactoryGirl.create(:shopper0,user:@user)
    @product = FactoryGirl.create(:product0)
    @subject = FactoryGirl.create(:request0,shopper:@shopper,product:@product)
  end

  it "request should be valid" do
    expect(@subject).to be_valid
  end

  




end
