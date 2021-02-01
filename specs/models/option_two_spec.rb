require_relative "../../models/initialization"

describe OptionOne do
	before do
		@user = User.new
		@user.acc_balance = Initialization.initial_account_amount
		@option_two = OptionTwo.new("OptionTwo")
	end
	context "should change the account balance" do
		it "if positive value is entered and show the current balance" do
			allow_any_instance_of(Kernel).to receive(:gets).and_return('1')
			expect {
				@option_two.execute(@user)
			}.to output("Enter the amount to recharge:\nRecharge Completed successfully. Current Balance is: 101\n").to_stdout
		end
	end
	context "should not change the account balance" do
		it "if negative value is entered and show error message" do
			allow_any_instance_of(Kernel).to receive(:gets).and_return('-1')
			expect {
				@option_two.execute(@user)
			}.to output("Enter the amount to recharge:\nPlease enter a positive value\n").to_stdout
		end
	end
  
	it "should show error message if user input is non numerical" do
		allow_any_instance_of(Kernel).to receive(:gets).and_return('abc')
		expect {
			@option_two.execute(@user)
		}.to output("Enter the amount to recharge:\nSomething went wrong please try again.\n").to_stdout
	end
end