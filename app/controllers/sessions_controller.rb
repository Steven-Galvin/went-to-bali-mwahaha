class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome back <span id='nav-user'>" + user.name + "</span>!"
      redirect_to '/'
    else
      flash[:alert] = "Email or password are incorrect"
      redirect_to '/sign_in'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Signed out succesfully"
    redirect_to '/sign_in'
  end

end
