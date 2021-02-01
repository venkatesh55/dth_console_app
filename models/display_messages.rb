module DisplayMessages

	def display_info(infos = [])
		infos.each do |info|
			display_msg "#{info[:name]}: #{info[:value]}"
		end
	end

  def user_input_msg(msg)
  	display_msg "#{msg}:"
  end

	def display_error(err_msg)
		display_msg err_msg
	end

	def display_success(succ_msg)
		display_msg succ_msg
	end

	def display_unknown_error_msg
		display_msg "Something went wrong please try again."
	end

	def display_heading(msg)
		display_msg msg
	end

	def in_rupees(amt)
    amt ||= 0
		"#{amt} Rs"
	end
  
	def display_msg(msg)
		puts msg
	end
end