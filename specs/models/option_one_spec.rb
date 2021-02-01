require_relative "../../models/initialization"

describe OptionOne do
	before do
		@user = User.new
		@user.acc_balance = Initialization.initial_account_amount
		@option_one = OptionOne.new("OptionOne")
	end
	context "should display user details" do

		it "display account balance" do
			expect {
				@option_one.display_acc_balance(@user)
			}.to output("Account Balance: 100\n").to_stdout
		end
		context "display account balance and" do

			it "current subscriptions if present" do
				@user.package = Initialization::PACKS.values.first
				expect {
					@option_one.execute(@user)
				}.to output("Account Balance: 100\nCurrent subscription: Silver\n").to_stdout
			end
      
			it "current subscriptions not subscribed message if not present" do
				expect {
					@option_one.execute(@user)
				}.to output("Account Balance: 100\nCurrent subscription: Not subscribed\n").to_stdout
			end
	  end
	end
end