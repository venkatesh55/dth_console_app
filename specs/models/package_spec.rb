require_relative "../../models/initialization"

describe OptionOne do
	before do
		@package = Package.new("silver",50, [Channel.new("Zee",10), Channel.new("Sony", 15)])
	end

	it "should return first char in name in capitals if code is called" do
		expect(@package.code).to eq 'S'
	end

	it "should return name and code" do
		expect(@package.name_with_code).to eq "silver:'S'"
	end
  
	it "should return description" do
		expect {
			@package.description
		}.to output("silver Pack: Zee,Sony\nAmount: 50 Rs\n").to_stdout
	end
end


# class User

# end

# class Tweet
# end



# describe "Twitter" do
#   before do
#     @user = User.new
#     @tweet = Tweet.new
    
#   end
#   it "should show the user tweets" do
#     expect(@user.tweets.first.content).to eq "first tweet"
#   end
# end