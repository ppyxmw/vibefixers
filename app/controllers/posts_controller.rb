class PostsController < ApplicationController

  def new
    if current_user.artist
      @post = current_user.posts.new
    else
      redirect_to root_path
    end
  end

  def create
    p_params = post_params.update({ user_id: current_user.id })
    @post = Post.create(p_params)
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :tags, :summary, :description, :artwork)
  end
end



