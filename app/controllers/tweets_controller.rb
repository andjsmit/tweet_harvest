class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = Tweet.all
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
    # Make tweeter info available to view
    @tweeter = Tweeter.find @tweet.tweeter_id
    @ds_tweeter = Tweeter.find_by twuser_id: @tweet.data_set_twuser_id
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets
  # POST /tweets.json
  def create

    # Check if tweeter exists, if not create.
    # .permt (below) returns a new hash each time called
    # so need to copy params to change.
    tp = tweet_params
    if Tweeter.exists?(twuser_id: tweet_params[:twuser_id])
      tp[:tweeter] = Tweeter.find_by twuser_id: tweet_params[:twuser_id]
    else
      tweeter = Tweeter.new(twuser_id: tweet_params[:twuser_id])
      tweeter.save
      tp[:tweeter] = tweeter
    end

    # Save new tweet with tweeter.
    @tweet = Tweet.new(tp)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: 'Tweet was successfully created.' }
        format.json { render :show, status: :created, location: @tweet }
      else
        flash[:alert] = "Tweet could not be saved."
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:tw_id, :twuser_id, :content, :url, :retweets, :favorites, :data_set_twuser_id, :post_date, :tweeter, data_set_ids:[])
    end
end
