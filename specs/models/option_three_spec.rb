require_relative "../../models/initialization"

describe OptionOne do
	before do
		@user = User.new
		@user.acc_balance = Initialization.initial_account_amount
		@option_three = OptionThree.new("OptionThree")
	end

	it "should show all the available packs" do
		expect {
			@option_three.execute(@user)
		}.to output("Available packs for Subscription
Silver Pack: Zee,Sony,Star Plus
Amount: 50 Rs
Gold Pack: Zee,Sony,Star Plus,Discovery,Nat Geo
Amount: 100 Rs
Available channels Subscription
Zee: 10 Rs
Sony: 15 Rs
Star Plus: 20 Rs
Discovery: 10 Rs
Nat Geo: 20 Rs\n").to_stdout
	end
  
	it "should show new channel if added" do
		Initialization.const_set("CHANNELS",Initialization::CHANNELS.merge({:tv => Channel.new('TV',25)}))
		expect {
			@option_three.execute(@user)
		}.to output("Available packs for Subscription
Silver Pack: Zee,Sony,Star Plus
Amount: 50 Rs
Gold Pack: Zee,Sony,Star Plus,Discovery,Nat Geo
Amount: 100 Rs
Available channels Subscription
Zee: 10 Rs
Sony: 15 Rs
Star Plus: 20 Rs
Discovery: 10 Rs
Nat Geo: 20 Rs
TV: 25 Rs\n").to_stdout
	end
end