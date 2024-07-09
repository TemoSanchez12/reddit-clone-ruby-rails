class SubredditsController < ApplicationController
  before_action :require_login, except: [:index, :show]


  def index
    @subreddits = Subreddit.all

  end

  def show
    @subreddit = Subreddit.find(params[:id])
  end


end
