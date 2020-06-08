class PostsController < ApplicationController
  before_action :authenticate_user! 

  def index
    @post = Post.new
    @posts = Post.all
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comment = Comment.new
    @comments = @post.comments
    @value = ""
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, notice: "スレッドを投稿しました。"
    else
      @posts = Post.all
      @q = Post.ransack(params[:q])
      @posts = @q.result(distinct: true)
      render action: :index
    end
  end

  def destroy
  	@post = Post.find(params[:id])
  	@post.destroy
  	redirect_to posts_path, notice: "スレッドを削除しました。"
	end

  private

  def post_params
  	params.require(:post).permit(:title, :context, category_ids: [])
  end
end
