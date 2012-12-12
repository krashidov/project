require 'spec_helper'

describe "workouts/index" do
  before(:each) do
    assign(:workouts, [
      stub_model(Workout,
        :name => "Name",
        :time => "Time",
        :workout_type => "Workout Type",
        :content => "MyText",
        :user_id => 1
      ),
      stub_model(Workout,
        :name => "Name",
        :time => "Time",
        :workout_type => "Workout Type",
        :content => "MyText",
        :user_id => 1
      )
    ])
  end

  it "renders a list of workouts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Time".to_s, :count => 2
    assert_select "tr>td", :text => "Workout Type".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
