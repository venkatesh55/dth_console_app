class OptionSix < Option
  include Validations

	def initialize(name)
		super(name)
	end

	def execute(user)
		display_heading "Update email and phone number for notifications"
		if update_email(user) && update_phone(user)
		  display_success "Email and Phone updated successfully"
    end
	end
  
  def update_email(user)
    user_input_msg("Enter the email")
    email = gets.chomp
    if valid_email?(email)
      user.email = email
    else
      display_error "Email is not valid"
      return false
    end
    true
  end

  def update_phone(user)
    user_input_msg("Enter phone")
    phone = gets.chomp
    if valid_phone?(phone)
      user.phone = phone
    else
      display_error "Phone number is not valid"
      return false
    end
    true
  end
end