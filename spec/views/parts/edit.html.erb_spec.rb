require 'spec_helper'

describe "parts/edit" do
  before(:each) do
    @part = assign(:part, stub_model(Part,
      :part => "MyString"
    ))
  end

  it "renders the edit part form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", part_path(@part), "post" do
      assert_select "input#part_part[name=?]", "part[part]"
    end
  end
end
