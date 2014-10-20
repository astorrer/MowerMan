require 'spec_helper'

describe "parts/show" do
  before(:each) do
    @part = assign(:part, stub_model(Part,
      :part => "Part"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Part/)
  end
end
