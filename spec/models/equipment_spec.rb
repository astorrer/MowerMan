require 'spec_helper'

describe Equipment do
  it "has a valid factory" do
    expect(build(:equipment)).to be_valid
  end

  it "is invalid without a name" do
    equipment = build(:equipment, name: nil)
    equipment.valid?
    expect(equipment.errors[:name]).to include("can't be blank")
  end

  it "is invalid with a name longer than 45 characters" do
    equipment = build(:equipment, name: "Melt#{ 'M' * 46}")
    equipment.valid?
    expect(equipment.errors[:name]).to include("is too long (maximum is 45 characters)")
  end

  it "is invalid without a number" do
    equipment = build(:equipment, number: nil)
    equipment.valid?
    expect(equipment.errors[:number]).to include("can't be blank")
  end

  it "is invalid with a number longer than 10 characters" do
    equipment = build(:equipment, number: 123456) 
    equipment.valid?
    expect(equipment.errors[:number]).to include("is too long (maximum is 5 characters)")
  end

  it "is invalid with a duplicate number" do
    create(:equipment, number: 12345)
    equipment = FactoryGirl.build(:equipment, number: 12345)
    equipment.valid?
    expect(equipment.errors[:number]).to include("has already been taken")
  end
end