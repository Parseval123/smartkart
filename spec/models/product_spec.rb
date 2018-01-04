require 'rails_helper'

RSpec.describe Product, :type => :model do

  before(:each) do
    @subject = FactoryGirl.create(:product0)
  end

  it "product should be valid" do
    expect(@subject).to be_valid
  end

  # Test of presence validation

  it "name should be present" do
    @subject.name = nil
    expect(@subject).not_to be_valid
  end 

  it "label should be present" do
    @subject.label = nil
    expect(@subject).not_to be_valid
  end 

  it "package should be present" do
    @subject.package = nil
    expect(@subject).not_to be_valid
  end 

  # Test of length validation

  it "name should not be too long" do
    @subject.name = "a" * 51
    expect(@subject).not_to be_valid
  end

  it "label should not be too long" do
    @subject.label = "a" * 51
    expect(@subject).not_to be_valid
  end

  it "package should not be too long" do
    @subject.package = "a" * 51
    expect(@subject).not_to be_valid
  end

  #testing association

  describe "Associations" do

    it "has many owners" do
      assc = described_class.reflect_on_association(:owners)
      expect(assc.macro).to eq :has_many
    end

    it "has many requests" do
      assc = described_class.reflect_on_association(:requests)
      expect(assc.macro).to eq :has_many
    end

    it "has many markets" do
      assc = described_class.reflect_on_association(:markets)
      expect(assc.macro).to eq :has_many
    end

  end
end
