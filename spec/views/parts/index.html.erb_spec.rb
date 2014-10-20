require 'spec_helper'

describe "parts/index" do
  before(:each) do
    assign(:parts, [
      stub_model(Part,
        :part => "Part"
      ),
      stub_model(Part,
        :part => "Part"
      )
    ])
  end

  it "renders a list of parts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Part".to_s, :count => 2
  end
end
