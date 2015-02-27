class CommentsController < ApplicationController

  def index

  end

  def new

  end

  def create
    @comment = current_user.comments.create(comment_params)
    respond_to do |format|
      format.html { redirect_to @advert_comment, notice: 'User was successfully created.' }
      format.js{}
    end
  end

  def edit
    @update_comment = Comment.find(params[:id])
  end

  def update
    @update_comment = Comment.find(params[:id])
    @update_comment.update(comment_params)
    respond_to do |format|
      format.html { redirect_to @comment, notice: 'User was successfully update.' }
      format.js{}
    end
  end

  def show

  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @advert_comment, notice: 'User was successfully created.' }
      format.js{}
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :advert_id)
  end

  def comment_update_params
    params.require(:comment).permit(:text)
  end

end
