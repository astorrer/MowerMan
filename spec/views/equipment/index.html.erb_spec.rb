require 'spec_helper'

describe "equipment/index" do
  before(:each) do
    assign(:equipment, [
      stub_model(Equipment,
        :equipment => "Equipment"
      ),
      stub_model(Equipment,
        :equipment => "Equipment"
      )
    ])
  end

  it "renders a list of equipment" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Equipment".to_s, :count => 2
  end
end
