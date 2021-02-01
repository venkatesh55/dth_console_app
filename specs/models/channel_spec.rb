require_relative "../../models/initialization"

describe OptionOne do
	before do
		@channel = Channel.new("Zee",10)
	end

	it "should return name in upcase" do
		expect(@channel.name_upcase).to eq "ZEE"
	end
  
	it "should return description" do
		expect {
			@channel.description
		}.to output("Zee: 10 Rs\n").to_stdout
	end
end