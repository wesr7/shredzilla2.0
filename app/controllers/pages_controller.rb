class PagesController < ApplicationController

  def index
  end

  def about
  end

  def dashboard
  end

  def blog
    @posts = Post.all
  end

  def admin
    @post = current_user.posts.new
  end

end
