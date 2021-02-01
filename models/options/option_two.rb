class OptionTwo < Option
	def initialize(name)
		super(name)
	end
  
	def execute(user)
		user_input_msg("Enter the amount to recharge")
		begin
			user_input = Integer(gets.chomp)
			if user_input >= 0
			  user.acc_balance += user_input
			else
			  display_error "Please enter a positive value"
			  return
			end
		rescue
			display_unknown_error_msg
			return
		end
		display_info([{name:"Recharge Completed successfully. Current Balance is", value: user.acc_balance.to_s}])
	end
end