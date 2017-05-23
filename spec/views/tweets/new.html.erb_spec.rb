require 'rails_helper'

RSpec.describe "tweets/new", type: :view do
  before(:each) do
    assign(:tweet, Tweet.new(
      :tw_id => "MyString",
      :content => "MyString",
      :url => "MyString",
      :retweets => 1,
      :favorites => 1,
      :data_set_twuser_id => "MyString",
      :tweeter => ""
    ))
  end

  it "renders new tweet form" do
    render

    assert_select "form[action=?][method=?]", tweets_path, "post" do

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
