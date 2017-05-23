require "rails_helper"

RSpec.describe TweetersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tweeters").to route_to("tweeters#index")
    end

    it "routes to #new" do
      expect(:get => "/tweeters/new").to route_to("tweeters#new")
    end

    it "routes to #show" do
      expect(:get => "/tweeters/1").to route_to("tweeters#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tweeters/1/edit").to route_to("tweeters#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tweeters").to route_to("tweeters#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tweeters/1").to route_to("tweeters#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tweeters/1").to route_to("tweeters#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tweeters/1").to route_to("tweeters#destroy", :id => "1")
    end

  end
end
