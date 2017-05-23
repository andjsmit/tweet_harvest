require 'rails_helper'

RSpec.describe "tweeters/show", type: :view do
  before(:each) do
    @tweeter = assign(:tweeter, Tweeter.create!(
      :twuser_id => "Twuser",
      :screen_name => "Screen Name",
      :name => "Name",
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Twuser/)
    expect(rendered).to match(/Screen Name/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Url/)
  end
end
