require_relative '../models/display_messages'

class Package
	attr_accessor :name, :price, :channels
	include DisplayMessages

	def initialize(name, price, channels)
		@name = name
		@price = price
		@channels = channels
	end

	def code
		name.to_s[0].upcase
	end

	def description
		display_info([{name:"#{name} Pack", value: channels.map(&:name).join(",")}])
		display_info([{name:"Amount", value: in_rupees(price)}])
	end

	def name_with_code
		"#{name}:'#{code}'"
	end

end