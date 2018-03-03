class CommentsController < ApplicationController
  def index
  end

  def create
    @comment = current_user.comments.new(comment_params)
    respond_to do |format|
      if @comment.save!
        format.html { redirect_to root_path }
        # used to find the correct post to add the comment to in comments/create.js.erb
        @post_id = params[:comment][:post_id] 
        format.js
      else
        format.json { render json: { error: @comment.errors.full_messages }, status: 422 }
      end
    end
  end

  def update
    @comment = current_user.comments.find(params[:id])
    respond_to do |format|
      if @comment.update_attributes(comment_params)
        format.json { respond_with_bip(@comment) }
      end
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    respond_to do |format|
      if @comment.destroy
        format.json { render json: { deleted: true } }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
