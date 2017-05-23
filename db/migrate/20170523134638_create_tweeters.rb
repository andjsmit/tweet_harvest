class CreateTweeters < ActiveRecord::Migration[5.1]
  def change
    create_table :tweeters do |t|
      t.string :twuser_id
      t.string :screen_name
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
