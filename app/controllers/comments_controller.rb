class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      flash[:success] = 'comment created successfully'
      redirect_to post_path(@comment.post_id)
    else
      flash[:danger] = 'Failed to comment'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end
end
