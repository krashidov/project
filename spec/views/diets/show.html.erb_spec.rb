require 'spec_helper'

describe "diets/show" do
  before(:each) do
    @diet = assign(:diet, stub_model(Diet,
      :name => "Name",
      :time => "Time",
      :info => "MyText",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Time/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
  end
end
