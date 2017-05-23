class Tweet < ApplicationRecord
  belongs_to: tweeter
  has_and_belongs_to_many :date_sets
end
