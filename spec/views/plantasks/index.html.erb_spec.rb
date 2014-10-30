require 'spec_helper'

describe "plantasks/index" do
  before(:each) do
    assign(:plantasks, [
      stub_model(Plantask,
        :area => "Area",
        :equipment => "Equipment",
        :part => "Part",
        :description => "MyText",
        :data_type => "Data Type",
        :upper => 1,
        :lower => 2,
        :current_status => "Current Status"
      ),
      stub_model(Plantask,
        :area => "Area",
        :equipment => "Equipment",
        :part => "Part",
        :description => "MyText",
        :data_type => "Data Type",
        :upper => 1,
        :lower => 2,
        :current_status => "Current Status"
      )
    ])
  end

  it "renders a list of plantasks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Area".to_s, :count => 2
    assert_select "tr>td", :text => "Equipment".to_s, :count => 2
    assert_select "tr>td", :text => "Part".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Data Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Current Status".to_s, :count => 2
  end
end
