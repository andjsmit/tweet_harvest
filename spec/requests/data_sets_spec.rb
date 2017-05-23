require 'rails_helper'

RSpec.describe "DataSets", type: :request do
  describe "GET /data_sets" do
    it "works! (now write some real specs)" do
      get data_sets_path
      expect(response).to have_http_status(200)
    end
  end
end
