class PostsController < ApplicationController

  def index
  	 @post = Post.new
     @posts = Post.all
     @user = current_user
     @post_comment = PostComment.new

  end

  def show
  	@post = Post.find(params[:id])
    @user = @post.user
    @post_comment = PostComment.new
    @post_n = Post.new
  end

  def create
  	@post = current_user.posts.new(post_params)
    if @post.save
    redirect_to post_path(@post.id)
  else
    @posts = Post.all
    @user = current_user
     render :index
   end
  	end

  def edit
    @post = Post.find(params[:id])

  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
    redirect_to post_path(@post.id) ,notice: 'You have updated book successfully.'
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private
  def post_params
  	params.require(:post).permit(:title, :body, :profile_image, :username, :post_id)
end
end
