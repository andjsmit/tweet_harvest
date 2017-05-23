require 'rails_helper'

RSpec.describe "data_sets/edit", type: :view do
  before(:each) do
    @data_set = assign(:data_set, DataSet.create!(
      :name => "MyString",
      :description => "MyText",
      :source => "MyString",
      :filename => "MyString"
    ))
  end

  it "renders the edit data_set form" do
    render

    assert_select "form[action=?][method=?]", data_set_path(@data_set), "post" do

      assert_select "input[name=?]", "data_set[name]"

      assert_select "textarea[name=?]", "data_set[description]"

      assert_select "input[name=?]", "data_set[source]"

      assert_select "input[name=?]", "data_set[filename]"
    end
  end
end
