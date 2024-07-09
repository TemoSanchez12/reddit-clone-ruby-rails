class SubredditsController < ApplicationController
  before_action :require_login, except: [:index, :show]


  def index
    @subreddits = Subreddit.all

  end

  def show
    @subreddit = Subreddit.find(params[:id])
    @posts = @subreddit.posts
  end

  def new
    @subreddit = Subreddit.new
  end

  def create
    @subreddit = current_user.subreddits.build(subreddit_params)

    if @subreddit.save
      redirect_to @subreddit, notice: "Subreddit was successfully created"
    else
      puts 'Something went wrong while creating new subreddit'
      render :new
    end
  end

  def edit
    @subreddit = Subreddit.find(params[:id])
  end

  def update
    @subreddit = Subreddit.find(params[:id])

    if @subreddit.update(subreddit_params)
      redirect_to @subreddit
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @subreddit = Subreddit.find(params[:id])
    if @subreddit.user.id == current_user.id
      @subreddit.destroy
      redirect_to subreddits_path
    end
  end

  private

  def subreddit_params
    params.require(:subreddit).permit(:name, :description)
  end

end
