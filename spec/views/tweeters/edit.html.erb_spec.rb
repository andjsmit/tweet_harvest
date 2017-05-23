require 'rails_helper'

RSpec.describe "tweeters/edit", type: :view do
  before(:each) do
    @tweeter = assign(:tweeter, Tweeter.create!(
      :twuser_id => "MyString",
      :screen_name => "MyString",
      :name => "MyString",
      :url => "MyString"
    ))
  end

  it "renders the edit tweeter form" do
    render

    assert_select "form[action=?][method=?]", tweeter_path(@tweeter), "post" do

      assert_select "input[name=?]", "tweeter[twuser_id]"

      assert_select "input[name=?]", "tweeter[screen_name]"

      assert_select "input[name=?]", "tweeter[name]"

      assert_select "input[name=?]", "tweeter[url]"
    end
  end
end
