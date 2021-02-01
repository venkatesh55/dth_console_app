require '../console_app/models/initialization'

class Main
  extend DisplayMessages

	def self.start_app
		initialize_user
		while true
			dispaly_options
      user_input_msg("Please select an options")
			begin
				user_opt = gets.chomp.to_i
				break if user_opt == Initialization::EXIT_OPTION
				if Initialization.valid_opt_numbers.include?(user_opt)
					Initialization::OPTIONS[user_opt].execute(@user)
				else
					display_error "Please enter valid option"
				end
			rescue => e
				display_error "Something went wrong please try again"
			end
		end
	end

	def self.dispaly_options
		Initialization::OPTIONS.each do |opt_num,opt|
			opt.description(opt_num)
		end
	end

  private
		def self.initialize_user
			@user = User.new
			@user.acc_balance = Initialization.initial_account_amount
		end
end


Main.start_app