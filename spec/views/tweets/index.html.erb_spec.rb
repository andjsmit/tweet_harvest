require 'rails_helper'

RSpec.describe "tweets/index", type: :view do
  before(:each) do
    assign(:tweets, [
      Tweet.create!(
        :tw_id => "Tw",
        :content => "Content",
        :url => "Url",
        :retweets => 2,
        :favorites => 3,
        :data_set_twuser_id => "Data Set Twuser",
        :tweeter => ""
      ),
      Tweet.create!(
        :tw_id => "Tw",
        :content => "Content",
        :url => "Url",
        :retweets => 2,
        :favorites => 3,
        :data_set_twuser_id => "Data Set Twuser",
        :tweeter => ""
      )
    ])
  end

  it "renders a list of tweets" do
    render
    assert_select "tr>td", :text => "Tw".to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Data Set Twuser".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
