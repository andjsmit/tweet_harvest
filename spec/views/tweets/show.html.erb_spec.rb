require 'rails_helper'

RSpec.describe "tweets/show", type: :view do
  before(:each) do
    @tweet = assign(:tweet, Tweet.create!(
      :tw_id => "Tw",
      :content => "Content",
      :url => "Url",
      :retweets => 2,
      :favorites => 3,
      :data_set_twuser_id => "Data Set Twuser",
      :tweeter => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Tw/)
    expect(rendered).to match(/Content/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Data Set Twuser/)
    expect(rendered).to match(//)
  end
end
