class Tweeter < ApplicationRecord
  has_many :tweets

  def save
    retrieve_tweeter
    super
  end

  def retrieve_tweeter
    client = Twitter::REST::Client.new do |config|
      config.consumer_key         = ENV["twitter_consumer_key"]
      config.consumer_secret      = ENV["twitter_consumer_secret"]
      config.access_token         = ENV["twitter_access_token"]
      config.access_token_secret  = ENV["twitter_access_token_secret"]
    end
    begin
      user = client.user(self.twuser_id.to_i)
      self.screen_name = user.screen_name
      self.name = user.name
      self.url = user.uri
    rescue Exception
      self.screen_name = "N/A"
      self.name = "N/A"
      self.url = "N/A"
    end
  end

end
