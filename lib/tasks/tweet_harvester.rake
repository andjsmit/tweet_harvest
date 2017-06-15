namespace :tweet_harvester do
  desc "Fetch tweets from given CSV file."
  task fetch_tweets: :environment do
    require 'csv'
    log = ActiveSupport::Logger.new('log/tweet_harvester.log')
    start_time = Time.now
    log.info "Fetch started at #{start_time}"

    csv_file = ENV['CSVFILE']
    data_set = ENV['DATASET'].to_i

    # test file /Users/andjsmit/tmp/tweet_data/tweet_test.csv
    log.info "File : #{csv_file}, Data Set : #{data_set}"

    CSV.foreach('/Users/andjsmit/tmp/tweet_data/tweet_test.csv') do |row|
       tweet_id = row[0]
       tweeter_id = row[1]
       # If tweet exists then update data_set_ids, else create new tweet.
       if Tweet.exists?(tw_id: tweet_id)
         tweet = Tweet.find_by tw_id: tweet_id
         if not tweet.data_set_ids.include?(data_set)
           Log.info "Added data set #{data_set} to tweet #{tweet_id}."
           data_set_tweet = DataSetTweet.new(data_set_id: data_set, tweet_id: tweet.id)
           data_set_tweet.save
         else
           log.info "Data set #{data_set} already contains tweet #{tweet_id}."
         end

       else
         tweet = Tweet.new(tw_id: tweet_id, data_set_twuser_id: tweeter_id, data_set_ids: [data_set])
         if tweet.save
           log.info "Tweet #{tweet_id} added as tweet id #{tweet.id}."
         else
           log.info "Could not retrieve tweet #{tweet_id}."
         end
       end
    end
    end_time = Time.now
    log.info "Fetch complete at #{end_time}"
  end

end
