json.extract! tweet, :id, :tw_id, :content, :url, :retweets, :favorites, :data_set_twuser_id, :post_date, :tweeter, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
