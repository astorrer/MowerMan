require 'spec_helper'

describe Part do
  it "has a valid factory" do
    expect(build(:part)).to be_valid
  end

  it "is invalid without a name" do
    part = build(:part, name: nil)
    part.valid?
    expect(part.errors[:name]).to include("can't be blank")
  end

  it "is invalid with a name longer than 45 characters" do
    part = build(:part, name: "Melt#{ 'M' * 46}")
    part.valid?
    expect(part.errors[:name]).to include("is too long (maximum is 45 characters)")
  end

  it "is invalid with a duplicate name" do
    create(:part, name: 'Cog')
    part = FactoryGirl.build(:part, name: 'Cog')
    part.valid?
    expect(part.errors[:name]).to include("has already been taken")
  end
end
