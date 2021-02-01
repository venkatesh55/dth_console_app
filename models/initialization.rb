require_relative '../models/channel'
require_relative '../models/package'
require_relative '../models/user'
require_relative '../models/options/option'
require_relative '../models/options/option_one'
require_relative '../models/options/option_two'
require_relative '../models/options/option_three'
require_relative '../models/options/option_four'
require_relative '../models/options/option_five'
require_relative '../models/options/option_six'
require_relative '../models/options/option_exit'
require_relative '../models/options/show_user_information'

# Dir[File.join(".", "/models/options/*.rb")].each do |f|
#   require f
# end


class Initialization

	EXIT_OPTION = 7

	CHANNELS = {
		:zee => Channel.new("Zee",10),
    :sony => Channel.new("Sony", 15),
    :star_plus => Channel.new("Star Plus", 20),
    :discovery => Channel.new("Discovery", 10),
    :nat_geo => Channel.new("Nat Geo", 20),
	}
	
	PACKS = {
		1 => Package.new("Silver",50, [CHANNELS[:zee], CHANNELS[:sony], CHANNELS[:star_plus]]),
		2 => Package.new("Gold", 100, [CHANNELS[:zee], CHANNELS[:sony], CHANNELS[:star_plus],CHANNELS[:discovery], CHANNELS[:nat_geo]])
	}
	OPTIONS = {
		1 => OptionOne.new("View account balance and current subscription"),
		2 => OptionTwo.new("Recharge Account"),
		3 => OptionThree.new("View available packs and channels"),
		4 => OptionFour.new("Subscribe to base packs"),
		5 => OptionFive.new("Add channels to an existing subscription"),
		6 => OptionSix.new("Update email and phone number for notifications"),
		EXIT_OPTION => OptionExit.new("Exit"),
    8 => ShowUserInformation.new("Check email and phone")
	}

  def self.get_discount_percentage
    10.0
  end

  def self.valid_opt_numbers
    [1,2,3,4,5,6,8]
  end

  def self.initial_account_amount
    100
  end
end