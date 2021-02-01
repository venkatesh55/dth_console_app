class OptionFour < Option
	def initialize(name)
		super(name)
	end
  
	def execute(user)
		display_available_packs
		begin
			user_input = gets.chomp.upcase
			if Initialization::PACKS.values.map(&:code).include?(user_input)
				package = Initialization::PACKS.values.select{|pack| pack.code == user_input}.first
				user_input_msg("Enter the months")
			  user_input_months = gets.chomp.to_i
			  if user_input_months >= 3
				  total_amt = package.price.to_i*user_input_months
				  discount = calculate_discount(total_amt)
				  total_amt = total_amt - discount
			  else
			  	total_amt = package.price.to_i*user_input_months
			  end
			  if user.acc_balance >= total_amt && user.acc_balance -= total_amt
			  	user.package = package
			  	subscription_details(user, package, user_input_months, discount, total_amt)
			  else
			  	display_error "You don't have sufficient balance in you account" && return
			  end
			else
				display_error "Please enter a valid character"
				return
			end
		rescue => e
			display_unknown_error_msg
		end
	end

	def subscription_details(user, package, months, discount, total_after_dis)
		display_info([
			{name: "You have successfully subscribed the following pack", value: package.code},
			{name: "Monthly price", value: in_rupees(package.price)},
			{name: "No of months", value: months},
			{name: "Subscription Amount", value: in_rupees(package.price.to_i * months.to_i)},
			{name: "Discount applied", value: in_rupees(discount)},
			{name: "Final Price after discount", value: in_rupees(total_after_dis)}
		])
		send_succ_notifications(user)
	end

	def send_succ_notifications(user)
    return unless user
		send_sms(user.phone) if user.phone
		send_email(user.email) if user.email
	end

  def display_available_packs
    value = Initialization::PACKS.values.map(&:name_with_code).join(",")
    display_info([{name:"Enter the pack you wish to subscribe", value: "(#{value})"}])
  end

  def calculate_discount(amt)
    raise "Amount is nil" unless amt
    (amt*(Initialization.get_discount_percentage/100)).to_i
  end
end