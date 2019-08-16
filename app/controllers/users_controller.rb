class UsersController < ApplicationController

def index
   @post = Post.new
   @posts = Post.all
   @users = User.all
   @user = current_user

end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @post = Post.new

   end

# 編集ページ
  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
      redirect_to user_path(current_user)
    end
    end

  def update
  @user = User.find(params[:id])
  if @user.update(user_params)
  redirect_to user_path(@user.id),notice: 'You have updated user sucsessfully.'
else
  render :edit

end
  end

  private
  def user_params
  	params.require(:user).permit(:username, :profile_image, :introduction)
  end
end
