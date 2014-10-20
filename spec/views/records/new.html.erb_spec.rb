require 'spec_helper'

describe "records/new" do
  before(:each) do
    assign(:record, stub_model(Record,
      :status => "MyString",
      :data => 1,
      :plantask__id => 1
    ).as_new_record)
  end

  it "renders new record form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", records_path, "post" do
      assert_select "input#record_status[name=?]", "record[status]"
      assert_select "input#record_data[name=?]", "record[data]"
      assert_select "input#record_plantask__id[name=?]", "record[plantask__id]"
    end
  end
end
