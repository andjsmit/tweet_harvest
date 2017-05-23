require 'rails_helper'

RSpec.describe "data_sets/show", type: :view do
  before(:each) do
    @data_set = assign(:data_set, DataSet.create!(
      :name => "Name",
      :description => "MyText",
      :source => "Source",
      :filename => "Filename"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Source/)
    expect(rendered).to match(/Filename/)
  end
end
