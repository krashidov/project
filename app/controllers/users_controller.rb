class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :following]
  before_filter :correct_user, only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
    @post = current_user.posts.build

    @workout = @user.workouts
    @photo = Photo.new

    @diet = @user.diets
    @photos = @user.photos
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new (params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else 
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def following
    #@title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
    #@users = 
  end

  def followers 
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private
  def correct_user
    @user = User.find(params[:id])
    redirect_back_or(root_path) unless current_user?(@user)
  end


end
