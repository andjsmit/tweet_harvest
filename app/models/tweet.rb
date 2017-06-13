class Tweet < ApplicationRecord

  require 'twitter'

  belongs_to :tweeter
  has_many :data_set_tweets
  has_many :data_sets, through: :data_set_tweets

  def save
    begin
      retrieve_tweet
    rescue
      puts "Could not retrieve tweet #" + self.tw_id.to_s
      return false
    end
    super
  end

  def retrieve_tweet
    client = Twitter::REST::Client.new do |config|
      config.consumer_key         = ENV["twitter_consumer_key"]
      config.consumer_secret      = ENV["twitter_consumer_secret"]
      config.access_token         = ENV["twitter_access_token"]
      config.access_token_secret  = ENV["twitter_access_token_secret"]
    end
    tweet = client.status(self.tw_id, options = {})
    self.content = tweet.full_text
    self.url = tweet.uri
    self.retweets = tweet.retweet_count.to_s
    self.favorites = tweet.favorite_count.to_s
    self.post_date = tweet.created_at
    self.data_set_twuser_id = self.tweeter_id
    if self.tweeter_id != tweet.user.id
      puts "Data Set Tweeter : " + tweet.user.id.to_s
      puts "Actual Tweeter: " + tweet.user.id.to_s
      if Tweeter.exists?(twuser_id: tweet.user.id)
        tweeter = Tweeter.find_by twuser_id: tweet.user.id
        self.tweeter_id = tweeter.id
      else
        tweeter = Tweeter.new(twuser_id: tweet.user.id)
        tweeter.save
        self.tweeter_id = tweeter.id
      end
    end
  end

end
