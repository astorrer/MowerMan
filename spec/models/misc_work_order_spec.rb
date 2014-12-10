require 'spec_helper'

describe MiscWorkOrder do
  it "has a valid factory" do
    expect(build(:misc_work_order)).to be_valid
  end
end
