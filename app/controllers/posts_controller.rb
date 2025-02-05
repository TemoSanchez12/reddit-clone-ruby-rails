class PostsController < ApplicationController
  before_action :require_login, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: "post was successfully created."
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user.id == current_user.id
      @post.destroy
      redirect_to subreddit_path(@post.subreddit), notice: "Post was successfully deleted"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :subreddit_id)
  end

end
