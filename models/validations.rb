module Validations
  def valid_email?(email)
    !email.match(/^.+@.+$/).nil?
  end

  def valid_phone?(phone)
    phone.size == 10
  end
end