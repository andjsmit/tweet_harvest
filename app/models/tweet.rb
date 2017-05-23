class Tweet < ApplicationRecord

  require 'twitter'

  belongs_to :tweeter
  has_and_belongs_to_many :data_sets

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
  end

end
