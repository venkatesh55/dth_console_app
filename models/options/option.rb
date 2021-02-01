require_relative '../display_messages'
require_relative '../notifications'
require_relative '../initialization'
require_relative '../validations'

class Option
	include DisplayMessages
	include Notifications
	attr_accessor :name

	def initialize(name)
		@name = name
	end

	def execute(user)
		raise "Sub classes should implement this function"
	end

	def description(opt_num)
		display_msg("#{opt_num}: #{name}")
	end
end
