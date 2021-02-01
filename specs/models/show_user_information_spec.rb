require_relative "../../models/initialization"

describe "ShowUserInformation" do
  before do
    @user = User.new
    @show_user_info = ShowUserInformation.new("Check email and phone")
  end

  it "should return nil if user email address does not exist" do
    expect(@show_user_info.get_user_email(@user)).to eq nil
  end

  it "should return user email address" do
    @user.email = "test@test.com"
    expect(@show_user_info.get_user_email(@user)).to eq "test@test.com"
  end

  it "should return nil if user phone number does not exist" do
    expect(@show_user_info.get_user_phone(@user)).to eq nil
  end

  it "should return user phone number" do
    @user.phone = "1234567890"
    expect(@show_user_info.get_user_phone(@user)).to eq "1234567890"
  end

  it "should display user email and phone" do
    @user.email = "test@test.com"
    @user.phone = "1234567890"
    expect{
      @show_user_info.execute(@user)
    }.to output("test@test.com\n1234567890\n").to_stdout
  end
end