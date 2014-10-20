require 'spec_helper'

describe "plantasks/show" do
  before(:each) do
    @plantask = assign(:plantask, stub_model(Plantask,
      :area => "Area",
      :equipment => "Equipment",
      :part => "Part",
      :description => "MyText",
      :date => "MyText",
      :data_type => "Data Type",
      :upper => 1,
      :lower => 2,
      :current_status => "Current Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Area/)
    rendered.should match(/Equipment/)
    rendered.should match(/Part/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/Data Type/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Current Status/)
  end
end
