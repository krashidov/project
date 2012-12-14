class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @post = current_user.posts.build 
      @diet = current_user.diets.build
      @workout = current_user.workouts.build

      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
end
