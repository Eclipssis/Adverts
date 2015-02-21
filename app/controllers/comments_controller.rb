class CommentsController < ApplicationController

  def new

  end

  def create
    @comment = current_user.comments.create(comment_params)
    redirect_to @comment.advert
  end

  def update

  end

  def show

  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :advert_id)
  end

end
