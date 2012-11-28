class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @post = current_user.posts.build 
    end
  end
end
