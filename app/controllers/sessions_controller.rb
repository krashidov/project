class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
      #Sign user in
    else
      flash.now[:error] = "Invalid password/email combo"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
