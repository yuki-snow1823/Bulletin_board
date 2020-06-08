class CommentsController < ApplicationController
  before_action :authenticate_user! 

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(post_comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      @post = Post.find(params[:post_id])
      @user = @post.user
      @comments = @post.comments
      render "posts/show"
    end
  end

  private
  def post_comment_params
    params.require(:comment).permit(:context)
  end

end
