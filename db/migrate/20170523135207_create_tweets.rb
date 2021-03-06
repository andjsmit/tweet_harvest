class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.string :tw_id
      t.string :content
      t.string :url
      t.integer :retweets
      t.integer :favorites
      t.string :data_set_twuser_id
      t.string :twuser_id
      t.date :post_date
      t.belongs_to :tweeter, index: true

      t.timestamps
    end
    add_index :tweets, :tw_id, unique: true
  end
end
