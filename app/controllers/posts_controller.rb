class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def index
  end

  def create  
      @post = current_user.posts.build(params[:post])
      if @post.save
        flash[:success] = "status updated!"
        redirect_to current_user
        #redirect_to "/show"
      else
        @feedposts = []
        render 'static_pages/home'
      end
  end





  def destroy
  end


end