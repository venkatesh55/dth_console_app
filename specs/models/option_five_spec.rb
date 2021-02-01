require_relative "../../models/initialization"

describe OptionFive do
  before do
    @user = User.new
    @user.acc_balance = Initialization.initial_account_amount
    @option_five = OptionFive.new("OptionFive")
  end
  
  it "should dispaly error if no pack is subscribed" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('zee')
    expect {
      @option_five.execute(@user)
    }.to output("Enter the channel names to add:\nNo package exists for this user\n").to_stdout
  end

  it "should dispaly error if no channel is invalid" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('zeeee')
    expect {
      @option_five.execute(@user)
    }.to output("Enter the channel names to add:\nzeeee is invalid\n").to_stdout
  end

  context "package exists" do

    before do
      @user.package = Package.new("Silver",50, [Initialization::CHANNELS[:zee]])
    end

    it "should notify is channel is already subscribed" do
      allow_any_instance_of(Kernel).to receive(:gets).and_return('zee')
      expect {
        @option_five.execute(@user)
      }.to output("Enter the channel names to add:\nzee channel already exists\n").to_stdout
    end

    it "should notify if user doesn't have sufficient balance" do
      @user.acc_balance = 0
      allow_any_instance_of(Kernel).to receive(:gets).and_return('sony')
      expect {
        @option_five.execute(@user)
      }.to output("Enter the channel names to add:\nYou don't have sufficient balance in you account\n").to_stdout
    end

    it "should add the channel into the pack and dispaly the account balance" do
      @user.acc_balance = 100
      allow_any_instance_of(Kernel).to receive(:gets).and_return('sony')
      expect {
        @option_five.execute(@user)
      }.to output("Enter the channel names to add:\nAccount Balance: 85\n").to_stdout
    end

  end
end