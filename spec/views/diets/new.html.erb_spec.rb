require 'spec_helper'

describe "diets/new" do
  before(:each) do
    assign(:diet, stub_model(Diet,
      :name => "MyString",
      :time => "MyString",
      :info => "MyText",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new diet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => diets_path, :method => "post" do
      assert_select "input#diet_name", :name => "diet[name]"
      assert_select "input#diet_time", :name => "diet[time]"
      assert_select "textarea#diet_info", :name => "diet[info]"
      assert_select "input#diet_user_id", :name => "diet[user_id]"
    end
  end
end
