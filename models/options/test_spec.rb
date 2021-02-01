class User

end

class Tweet
end



describe "Twitter" do
  before do
    @user = User.new
    @tweet = Tweet.new
    
  end
  it "should show the user tweets" do
    # expect(@user.tweets.first.content).to eq "first tweet"
  end
end