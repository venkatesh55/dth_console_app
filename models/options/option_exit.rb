class OptionExit < Option
  
	def initialize(name)
		super(name)
	end

	def execute(user)
		true
	end
end