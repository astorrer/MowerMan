require 'spec_helper'

describe Area do
  it "has a valid factory" do
    expect(build(:area)).to be_valid
  end

  it "is invalid without a name" do
    area = build(:area, name: nil)
    area.valid?
    expect(area.errors[:name]).to include("can't be blank")
  end
  
  it "is invalid with a name longer than 45 characters" do
    area = build(:area, name: "Melt#{ 'M' * 46}")
    area.valid?
    expect(area.errors[:name]).to include("is too long (maximum is 45 characters)")
  end
  
  it "is invalid without a number" do
    area = build(:area, number: nil)
    area.valid?
    expect(area.errors[:number]).to include("can't be blank")
  end
  
  it "is invalid with a number longer than 5 characters" do
    area = build(:area, number: 123456) 
    area.valid?
    expect(area.errors[:number]).to include("is too long (maximum is 5 characters)")
  end
  
  it "is invalid with a duplicate number" do
    create(:area, number: 12345)
    area = FactoryGirl.build(:area, number: 12345)
    area.valid?
    expect(area.errors[:number]).to include("has already been taken")
  end
end
