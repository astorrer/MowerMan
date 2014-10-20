require 'spec_helper'

describe "plantasks/edit" do
  before(:each) do
    @plantask = assign(:plantask, stub_model(Plantask,
      :area => "MyString",
      :equipment => "MyString",
      :part => "MyString",
      :description => "MyText",
      :date => "MyText",
      :data_type => "MyString",
      :upper => 1,
      :lower => 1,
      :current_status => "MyString"
    ))
  end

  it "renders the edit plantask form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", plantask_path(@plantask), "post" do
      assert_select "input#plantask_area[name=?]", "plantask[area]"
      assert_select "input#plantask_equipment[name=?]", "plantask[equipment]"
      assert_select "input#plantask_part[name=?]", "plantask[part]"
      assert_select "textarea#plantask_description[name=?]", "plantask[description]"
      assert_select "textarea#plantask_date[name=?]", "plantask[date]"
      assert_select "input#plantask_data_type[name=?]", "plantask[data_type]"
      assert_select "input#plantask_upper[name=?]", "plantask[upper]"
      assert_select "input#plantask_lower[name=?]", "plantask[lower]"
      assert_select "input#plantask_current_status[name=?]", "plantask[current_status]"
    end
  end
end
