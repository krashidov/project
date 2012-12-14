require 'spec_helper'

describe Post do
  pending "add some examples to (or delete) #{__FILE__}"
end

      describe "when post content is blank" do
    before { @post.content = ""}
    it { should_not be_valid }
  end