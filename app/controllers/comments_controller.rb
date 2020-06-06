class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(post_comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    @comment.save
    redirect_back(fallback_location: root_path)
  end

  private
  def post_comment_params
    params.require(:comment).permit(:context)
  end

end
