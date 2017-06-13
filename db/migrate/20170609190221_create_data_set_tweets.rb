class CreateDataSetTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :data_set_tweets do |t|
      t.references :data_set, foreign_key: true
      t.references :tweet, foreign_key: true

      t.timestamps
    end
  end
end
