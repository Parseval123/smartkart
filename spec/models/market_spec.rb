require 'rails_helper'

RSpec.describe Market, :type => :model do

  before(:each) do
    @manager = FactoryGirl.create(:manager0)
    @subject = FactoryGirl.create(:market0, manager:@manager)
  end

  it "market should be valid" do
    expect(@subject).to be_valid
  end

  # Test of presence validation

  it "address should be present" do
    @subject.address = nil
    expect(@subject).not_to be_valid
  end 

  it "group should be present" do
    @subject.group = nil
    expect(@subject).not_to be_valid
  end 

  it "info should be present" do
    @subject.info = nil
    expect(@subject).not_to be_valid
  end 

  # Test of length validation

  #it "address should not be too long" do
    #@subject.address = "a" * 47 + " ,Roma ,Italia"
    #expect(@subject).not_to be_valid
  #end

  it "group should not be too long" do
    @subject.group = "a" * 16
    expect(@subject).not_to be_valid
  end

  it "info should not be too long" do
    @subject.info = "a" * 101
    expect(@subject).not_to be_valid
  end

  # Test of format validation

  it "address validation should reject invalid addresses" do
    invalid_addresses = ["via alessandro severo .roma ,italia","via paolo paruta .roma .italia"]
    invalid_addresses.each do |invalid_address|
      @subject.address = invalid_address
      expect(@subject).not_to be_valid
    end
  end

  #testing association

  describe "Associations" do

    it "has many microposts" do
      assc = described_class.reflect_on_association(:microposts)
      expect(assc.macro).to eq :has_many
    end

    it "has many owners" do
      assc = described_class.reflect_on_association(:owners)
      expect(assc.macro).to eq :has_many
    end

    it "has one manager" do
      assc = described_class.reflect_on_association(:manager)
      expect(assc.macro).to eq :has_one
    end

  end

end
