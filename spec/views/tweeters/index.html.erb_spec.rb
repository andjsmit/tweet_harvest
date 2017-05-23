require 'rails_helper'

RSpec.describe "tweeters/index", type: :view do
  before(:each) do
    assign(:tweeters, [
      Tweeter.create!(
        :twuser_id => "Twuser",
        :screen_name => "Screen Name",
        :name => "Name",
        :url => "Url"
      ),
      Tweeter.create!(
        :twuser_id => "Twuser",
        :screen_name => "Screen Name",
        :name => "Name",
        :url => "Url"
      )
    ])
  end

  it "renders a list of tweeters" do
    render
    assert_select "tr>td", :text => "Twuser".to_s, :count => 2
    assert_select "tr>td", :text => "Screen Name".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
