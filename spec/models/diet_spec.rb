require 'spec_helper'

describe Diet do
  pending "add some examples to (or delete) #{__FILE__}"
end

  describe "when diet name is blank" do
    before { @diet.name = ""}
    it { should_not be_valid }
  end

    describe "when diet time is blank" do
    before { @diet.time = ""}
    it { should_not be_valid }
  end

    describe "when diet name is too big" do
    before { @diet.name = "a" * 51}
    it { should_not be_valid }
  end

      describe "when diet time is too big" do
    before { @diet.time = "a" * 51}
    it { should_not be_valid }
  end