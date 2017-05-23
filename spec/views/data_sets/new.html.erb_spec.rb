require 'rails_helper'

RSpec.describe "data_sets/new", type: :view do
  before(:each) do
    assign(:data_set, DataSet.new(
      :name => "MyString",
      :description => "MyText",
      :source => "MyString",
      :filename => "MyString"
    ))
  end

  it "renders new data_set form" do
    render

    assert_select "form[action=?][method=?]", data_sets_path, "post" do

      assert_select "input[name=?]", "data_set[name]"

      assert_select "textarea[name=?]", "data_set[description]"

      assert_select "input[name=?]", "data_set[source]"

      assert_select "input[name=?]", "data_set[filename]"
    end
  end
end
