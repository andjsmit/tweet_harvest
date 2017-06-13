class DataSet < ApplicationRecord
  has_many :data_set_tweets
  has_many :tweets, through: :data_set_tweets
end
