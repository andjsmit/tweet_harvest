require 'rails_helper'

RSpec.describe "data_sets/index", type: :view do
  before(:each) do
    assign(:data_sets, [
      DataSet.create!(
        :name => "Name",
        :description => "MyText",
        :source => "Source",
        :filename => "Filename"
      ),
      DataSet.create!(
        :name => "Name",
        :description => "MyText",
        :source => "Source",
        :filename => "Filename"
      )
    ])
  end

  it "renders a list of data_sets" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Source".to_s, :count => 2
    assert_select "tr>td", :text => "Filename".to_s, :count => 2
  end
end
