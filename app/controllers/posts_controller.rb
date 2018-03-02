class PostsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @post = current_user.posts.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path }
        format.js
      else
        format.json { render json: { error: @post.errors.full_messages }, status: 422 }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:content, images:[])
  end
end
