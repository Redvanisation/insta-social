# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    @like.save
    redirect_to post_path(@like.post_id)

    flash.now[:danger] = 'You already liked this post' unless @like.save
  end

  def destroy
    @like = Like.find_by(user_id: params[:id])
    @p = Post.find_by(id: @like.post_id)
    @like.destroy
    redirect_to post_path(@p.id)
  end

  private

  def like_params
    params.require(:like).permit(:post_id, :user_id)
  end
end
