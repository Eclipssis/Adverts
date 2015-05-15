class CommentsController < ApplicationController

  load_and_authorize_resource
  skip_load_resource :only => :create

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

  end

  def update
    if @comment.update_attributes(comment_update_params)
      respond_to do |format|
        format.html { redirect_to @update_comment }
        format.js{}
      end
    else
      respond_to do |format|
        format.html { redirect_to @update_comment }
        format.js{ render partial: "comments/comment_update_error" , locals: { update_comment: @comment } }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @comment }
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
