require 'spec_helper'

describe "records/edit" do
  before(:each) do
    @record = assign(:record, stub_model(Record,
      :status => "MyString",
      :data => 1,
      :plantask__id => 1
    ))
  end

  it "renders the edit record form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", record_path(@record), "post" do
      assert_select "input#record_status[name=?]", "record[status]"
      assert_select "input#record_data[name=?]", "record[data]"
      assert_select "input#record_plantask__id[name=?]", "record[plantask__id]"
    end
  end
end
