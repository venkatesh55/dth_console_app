class ShowUserInformation < Option

  def get_user_email(user)
    user.email
  end

  def get_user_phone(user)
    user.phone
  end

  def execute(user)
    display_msg(get_user_email(user))
    display_msg(get_user_phone(user))
  end

end