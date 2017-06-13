class DataSetTweet < ApplicationRecord
  belongs_to :data_set
  belongs_to :tweet
end
