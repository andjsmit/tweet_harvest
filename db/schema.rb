# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170523135512) do

  create_table "data_sets", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "source"
    t.string "filename"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tweeters", force: :cascade do |t|
    t.string "twuser_id"
    t.string "screen_name"
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["twuser_id"], name: "index_tweeters_on_twuser_id", unique: true
  end

  create_table "tweets", force: :cascade do |t|
    t.string "tw_id"
    t.string "content"
    t.string "url"
    t.integer "retweets"
    t.integer "favorites"
    t.string "data_set_twuser_id"
    t.string "twuser_id"
    t.date "post_date"
    t.integer "tweeter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tw_id"], name: "index_tweets_on_tw_id", unique: true
    t.index ["tweeter_id"], name: "index_tweets_on_tweeter_id"
  end

  create_table "tweets_data_sets", id: false, force: :cascade do |t|
    t.integer "tweet_id"
    t.integer "data_set_id"
    t.index ["data_set_id"], name: "index_tweets_data_sets_on_data_set_id"
    t.index ["tweet_id"], name: "index_tweets_data_sets_on_tweet_id"
  end

end
