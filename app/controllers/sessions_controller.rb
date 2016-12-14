class SessionsController < ApplicationController
  def create
    begin
      user = User.from_omniauth(env["omniauth.auth"])
      session[:user_id] = user.id
      flash[:notice] = "Welcome, #{user.name}! You can now leave a review on products"
    rescue
      flash[:danger] = "There was an error while trying to authenticate you..."
    end
    redirect_to request.env['omniauth.origin'] || root_url
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You are now Signed Off!"
    redirect_to root_url
  end

end
