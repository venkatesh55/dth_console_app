require_relative "../../models/initialization"

describe OptionSix do
  before do
    @user = User.new
    @user.acc_balance = Initialization.initial_account_amount
    @option_six = OptionSix.new("OptionSix")
  end

  it "should update email if valid email is entered" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('test@test.com')
    expect(@option_six.update_email(@user)).to eq true
    expect(@user.email).to eq 'test@test.com'
  end

  it "should show error msg if email is not valid" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('test')
    expect {
        @option_six.update_email(@user)
      }.to output("Enter the email:\nEmail is not valid\n").to_stdout
  end

  it "should update phone if valid phone is entered" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('9876543210')
    expect(@option_six.update_phone(@user)).to eq true
    expect(@user.phone).to eq '9876543210'
  end

  it "should show error msg if email is not valid" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('12345')
    expect {
        @option_six.update_phone(@user)
      }.to output("Enter phone:\nPhone number is not valid\n").to_stdout
  end
  
end