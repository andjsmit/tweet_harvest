require 'rails_helper'

RSpec.describe "tweets/edit", type: :view do
  before(:each) do
    @tweet = assign(:tweet, Tweet.create!(
      :tw_id => "MyString",
      :content => "MyString",
      :url => "MyString",
      :retweets => 1,
      :favorites => 1,
      :data_set_twuser_id => "MyString",
      :tweeter => ""
    ))
  end

  it "renders the edit tweet form" do
    render

    assert_select "form[action=?][method=?]", tweet_path(@tweet), "post" do

      assert_select "input[name=?]", "tweet[tw_id]"

      assert_select "input[name=?]", "tweet[content]"

      assert_select "input[name=?]", "tweet[url]"

      assert_select "input[name=?]", "tweet[retweets]"

      assert_select "input[name=?]", "tweet[favorites]"

      assert_select "input[name=?]", "tweet[data_set_twuser_id]"

      assert_select "input[name=?]", "tweet[tweeter]"
    end
  end
end
