require_relative "../../models/initialization"

describe OptionFour do
  before do
    @user = User.new
    @user.acc_balance = Initialization.initial_account_amount
    @option_four = OptionFour.new("OptionFour")
  end

  it "should show all the available packs" do
    expect {
      @option_four.display_available_packs
    }.to output("Enter the pack you wish to subscribe: (Silver:'S',Gold:'G')\n").to_stdout
  end

  it "should send success notifications if details present" do
    @user.email = "test@test.com"
    @user.phone = "9876543210"
    expect {
      @option_four.send_succ_notifications(@user)
    }.to output("SMS notification sent successfully to 9876543210\nEmail notification sent successfully to test@test.com\n").to_stdout
  end

  it "should calculate the discount based on discount percentage configured" do
    expect(@option_four.calculate_discount(300)).to eq 30
  end

  it "should dispaly subscription details afte user selects any successfully" do
    pack = Initialization::PACKS.values.first
    expect {
      @option_four.subscription_details(@user,pack,3, 30, 270)
    }.to output(
      "You have successfully subscribed the following pack: S
Monthly price: 50 Rs
No of months: 3
Subscription Amount: 150 Rs
Discount applied: 30 Rs
Final Price after discount: 270 Rs\n"
).to_stdout
  end

  it "should display 0 Rs if amount is 0" do
    expect(@option_four.in_rupees(0)).to eq "0 Rs"
  end

  it "should display amount in currency format with requested value" do
    amount = 45
    expect(@option_four.in_rupees(amount)).to eq "#{amount} Rs"
  end

end