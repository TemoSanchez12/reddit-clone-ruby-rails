class CommentsController < ApplicationController
  before_action :require_login

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      redirect_to @post, alert: 'Failed to create comment.'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    if current_user.id = @commnet.user.id
      @comment.destroy
      redirect_to @comment.post, notice: 'Comment was successfully deleted.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :parent_comment_id)
  end
end
