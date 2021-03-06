class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to links_path
    else
      render 'new'
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to login_path
  end

end
