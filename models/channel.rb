require_relative '../models/display_messages'
class Channel
	attr_accessor :name, :price
	include DisplayMessages

	def initialize(name,price)
		@name = name
		@price = price
	end

	def description
		display_info([{name:name, value: in_rupees(price)}])
	end
  
	def name_upcase
		name.upcase
	end
end