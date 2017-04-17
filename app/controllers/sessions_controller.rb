class SessionsController < ApplicationController
  def new # '/login' GET
  end

  def create # '/login' POST
    # find user
    # authenticate user
    # redirect to root_path with sucess message
    # else render :new with flash[:error]
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'You have been logged in successfully!'
      redirect_to root_path
    else
      flash[:error] = 'There was something wrong with your username or password'
      redirect_to login_path
    end
  end

  def destroy # '/logout' DELETE
    session[:user_id] = nil
    flash[:notice] = 'You have been successfully logged out.'
    redirect_to root_path
  end
end
