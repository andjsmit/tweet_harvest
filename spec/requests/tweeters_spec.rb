require 'rails_helper'

RSpec.describe "Tweeters", type: :request do
  describe "GET /tweeters" do
    it "works! (now write some real specs)" do
      get tweeters_path
      expect(response).to have_http_status(200)
    end
  end
end
