class OptionThree < Option
	def initialize(name)
		super(name)
	end

	def execute(user)
		display_heading "Available packs for Subscription"
		all_pack_details
		display_heading "Available channels Subscription"
		all_channel_details
	end

	def all_pack_details
		Initialization::PACKS.each{|pack_num, pack| pack.description}
	end
  
	def all_channel_details
     Initialization::CHANNELS.each{|chan_num, channel| channel.description}
	end
end