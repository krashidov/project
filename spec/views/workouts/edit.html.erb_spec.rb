require 'spec_helper'

describe "workouts/edit" do
  before(:each) do
    @workout = assign(:workout, stub_model(Workout,
      :name => "MyString",
      :time => "MyString",
      :workout_type => "MyString",
      :content => "MyText",
      :user_id => 1
    ))
  end

  it "renders the edit workout form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => workouts_path(@workout), :method => "post" do
      assert_select "input#workout_name", :name => "workout[name]"
      assert_select "input#workout_time", :name => "workout[time]"
      assert_select "input#workout_workout_type", :name => "workout[workout_type]"
      assert_select "textarea#workout_content", :name => "workout[content]"
      assert_select "input#workout_user_id", :name => "workout[user_id]"
    end
  end
end
