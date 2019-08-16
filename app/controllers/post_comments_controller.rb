class PostCommentsController < ApplicationController

def create
	@post = Post.find(params[:post_id])
	comment = current_user.post_comments.new(post_comment_params)
	# ここまででpost_idの定義がされていないので、post_idの定義を行う。
    comment.post_id = @post.id
    comment.save
    redirect_to post_path(@post.id)
end

private

def post_comment_params
	params.require(:post_comment).permit(:user_id, :comment, :post_comment, :post_id, :book_id)
end

end
