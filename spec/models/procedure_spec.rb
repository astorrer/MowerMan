require 'spec_helper'

describe Procedure do
  it "has a valid factory" do
    expect(build(:procedure)).to be_valid
  end

  it "is invalid without a name" do
    procedure = build(:procedure, name: nil)
    procedure.valid?
    expect(procedure.errors[:name]).to include("can't be blank")
  end

  it "is invalid with a name longer than 45 characters" do
    procedure = build(:procedure, name: "Melt#{ 'M' * 46}")
    procedure.valid?
    expect(procedure.errors[:name]).to include("is too long (maximum is 45 characters)")
  end

  it "is invalid with a duplicate name" do
    create(:procedure, name: 'Cog')
    procedure = FactoryGirl.build(:procedure, name: 'Cog')
    procedure.valid?
    expect(procedure.errors[:name]).to include("has already been taken")
  end
end
