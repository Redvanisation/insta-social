class LikesController < ApplicationController
def create
  @like = Like.new(like_params)
  @like.save
  redirect_to post_path(@like.post_id)

  if !@like.save
    flash.now[:danger] = "You already liked this post"
end
end

def destroy
  @like = Like.find_by(user_id: params[:id])
  @like.destroy
  redirect_to post_path(@like.post_id)
end
private

def like_params
   params.require(:like).permit(:post_id, :user_id)
end

end
