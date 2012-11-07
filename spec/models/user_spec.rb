require 'spec_helper'

describe User do

  before do
    @user = User.new(name: "Example User", email: "user@example.com", 
                     password: "password", password_confirmation: "password")
  end
  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }

  describe "when name is blank" do
    before { @user.name = ""}
    it { should_not be_valid }
  end

  describe "when name is too big" do
    before { @user.name = "a" * 51}
    it { should_not be_valid }
  end

  describe "when email format is wrong" do
    it "should be invalid" do
  	  addresses = %w[long@foo,com alex_at_foo.org komran.user@foo.
                     foo@bar_bill.com vicky@one+two.com]
      addresses.each do |invalid|
        @user.email = invalid
        @user.should_not be_valid
      end
    end
  end


describe "when email format is correct" do
  it "should be valid" do
      addresses = %w[long@foo.com alex@foo.org komran.user@foo.com
      			   vicky+two@foo.com]
      addresses.each do |valid|
        @user.email = valid
        @user.should be_valid
      end
    end
  end

  describe "when email address is not unique" do
    before do
      duplicate_user = @user.dup
      duplicate_user.email = @user.email.upcase
      duplicate_user.save
    end

    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " "}
    it { should_not be_valid }
  end

  describe "when password doesn't match pass confirmation" do
    before { @user.password_confirmation = "notpassword" }
    it { should_not be_valid }
  end
end
