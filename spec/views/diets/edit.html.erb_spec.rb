require 'spec_helper'

describe "diets/edit" do
  before(:each) do
    @diet = assign(:diet, stub_model(Diet,
      :name => "MyString",
      :time => "MyString",
      :info => "MyText",
      :user_id => 1
    ))
  end

  it "renders the edit diet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => diets_path(@diet), :method => "post" do
      assert_select "input#diet_name", :name => "diet[name]"
      assert_select "input#diet_time", :name => "diet[time]"
      assert_select "textarea#diet_info", :name => "diet[info]"
      assert_select "input#diet_user_id", :name => "diet[user_id]"
    end
  end
end
