class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def index
  end

  def create
      @post = current_user.posts.build(params[:post])
      if @post.save
        flash[:success] = "status updated!"
        redirect_to root_path
        #redirect_to "/show"
      else
        render 'static_pages/home'
      end
  end

  def destroy
  end


end