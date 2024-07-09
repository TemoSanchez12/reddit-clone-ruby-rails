class ApplicationController < ActionController::Base
  def index
    @subreddits = Subreddit.all
    @posts = Post.all
  end
end
