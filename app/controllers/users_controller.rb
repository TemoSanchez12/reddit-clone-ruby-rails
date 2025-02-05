class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Successfully registered.'

    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @subreddits = @user.subreddits
    @posts = @user.posts
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
