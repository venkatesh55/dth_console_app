class OptionFive < Option
	def initialize(name)
		super(name)
	end

	def execute(user)
		user_input_msg("Enter the channel names to add")
		begin
			user_inputs = gets.chomp.split(",")
			user_inputs.each{|name| add_channel_to_user(user,name)}
		rescue => e
			display_unknown_error_msg
			puts e
		end
	end

	def add_channel_to_user(user,name)
		if channel_name_valid?(name) && channel = get_channel_with_name(name)
			if pack_exist_for_user?(user)
				if channel_exits_in_user_pack?(user,channel)
					display_msg "#{name} channel already exists"
				else
          if user.acc_balance >= channel.price.to_i
  					user.acc_balance -= channel.price.to_i
  					user.package.channels << channel
  					display_info([{name:"Account Balance", value: user.acc_balance.to_s}])
          else
            display_error "You don't have sufficient balance in you account"
            return
          end
				end
			else
				display_error "No package exists for this user"
			end
		else
			display_error "#{name} is invalid"
			return
		end
	end

	def channel_name_valid?(name)
		Initialization::CHANNELS.values.map(&:name_upcase).include?(name.upcase)
	end

	def get_channel_with_name(name)
		Initialization::CHANNELS.values.select{|channel| channel.name_upcase == name.upcase}.first
	end

	def channel_exits_in_user_pack?(user,channel)
		return false unless pack_exist_for_user?(user)
		user.package.channels.map(&:name_upcase).include?(channel.name_upcase)
	end

	def pack_exist_for_user?(user)
		user.package
	end

end