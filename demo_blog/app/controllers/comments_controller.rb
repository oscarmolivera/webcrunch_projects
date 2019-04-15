# Comments Controller Code.
class CommentsController < ApplicationController
  before_action :find_comment, only: %i[create destroy]

  def create
    @comment = @post.comments.create(comments_params)
    redirect_to post_path(@post)
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comments_params
    params.require(:comment).permit(:name, :comment_text)
  end

  def find_comment
    @post = Post.find(params[:post_id])
  end
end
