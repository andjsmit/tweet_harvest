require 'rails_helper'

RSpec.describe "tweeters/new", type: :view do
  before(:each) do
    assign(:tweeter, Tweeter.new(
      :twuser_id => "MyString",
      :screen_name => "MyString",
      :name => "MyString",
      :url => "MyString"
    ))
  end

  it "renders new tweeter form" do
    render

    assert_select "form[action=?][method=?]", tweeters_path, "post" do

      assert_select "input[name=?]", "tweeter[twuser_id]"

      assert_select "input[name=?]", "tweeter[screen_name]"

      assert_select "input[name=?]", "tweeter[name]"

      assert_select "input[name=?]", "tweeter[url]"
    end
  end
end
