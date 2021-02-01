class OptionOne < Option
	def initialize(name)
		super(name)
	end

	def execute(user)
		display_acc_balance(user)
		if user.package
			display_curr_subscription(user)
		else
			display_info([{name:"Current subscription", value: "Not subscribed"}])
		end
	end

	def display_acc_balance(user)
		display_info([{name:"Account Balance", value: user.acc_balance.to_s}])
	end
  
	def display_curr_subscription(user)
    display_info([{name:"Current subscription", value: user.package.name}])
	end
end