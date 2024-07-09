class ApplicationController < ActionController::Base
  helper_method :current_user

  def index
    @subreddits = Subreddit.all
    @posts = Post.all
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless current_user
      redirect_to 'login', alert: 'You must be loadded in to access this section'
    end
  end

end
