class PostsController < ApplicationController
  def index
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    # @posts = Post.new
    # @post_comment = PostComment.new
    @value = ""
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, notice: "successfully created post!"
    else
      @posts = Post.all
      render action: :index
    end
  end

  private

  def post_params
  	params.require(:post).permit(:title, :context)
  end
end
