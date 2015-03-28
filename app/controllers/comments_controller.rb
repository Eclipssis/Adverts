class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.create(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to @comment, notice: 'User was successfully created.' }
        format.js{}
      end
    else
      respond_to do |format|
        format.html { redirect_to @comment, notice: 'User was successfully created.' }
        format.js{ render partial: "comments/comment_error" , locals: { comment: @comment } }
      end
    end
  end

  def edit
    @update_comment = Comment.find(params[:id])
  end

  def update
    @update_comment = Comment.find(params[:id])
    if @update_comment.update_attributes(comment_update_params)
      respond_to do |format|
        format.html { redirect_to @update_comment, notice: 'User was successfully update.' }
        format.js{}
      end
    else
      respond_to do |format|
        format.html { redirect_to @update_comment, notice: 'User was successfully created.' }
        format.js{ render partial: "comments/comment_update_error" , locals: { update_comment: @update_comment } }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @comment, notice: 'User was successfully created.' }
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
