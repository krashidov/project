require 'spec_helper'

describe "workouts/show" do
  before(:each) do
    @workout = assign(:workout, stub_model(Workout,
      :name => "Name",
      :time => "Time",
      :workout_type => "Workout Type",
      :content => "MyText",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Time/)
    rendered.should match(/Workout Type/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
  end
end
