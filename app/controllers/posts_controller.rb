class PostsController < ApplicationController
  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to('/blog')
    else
      render('/admin')
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
