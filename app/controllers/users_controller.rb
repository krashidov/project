class UsersController < ApplicationController
  #before_filter :signed_in_user, only: [:show]
  #before_filter :correct_user, only: [:show]

  def show
    @user = User.find(params[:id])
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
  end

  private
    def signed_in_user
      redirect_to root_path, notice: "Please sign in" unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path, notice: "invalid user #{@user.id}" unless current_user?(@user)
    end

end
