class SessionsController < ApplicationController

  def new
  end

  def create
    host = Host.find_by_email(params[:email])
    if host && host.authenticate(params[:password])
      session[:host_id] = host.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      redirect_to root_url, :notice => "Password or email incorrect!"
    end
  end

  def destroy
    session[:host_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
