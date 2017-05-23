class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.string :tw_id
      t.string :content
      t.string :url
      t.integer :retweets
      t.integer :favorites
      t.string :data_set_twuser_id
      t.date :post_date
      t.refernces :tweeter

      t.timestamps
    end
  end
end
