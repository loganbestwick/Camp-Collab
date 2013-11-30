class HostsController < ApplicationController

  def index
    @host = Host.new
    if session[:host_id]
      redirect_to host_events_path(Host.find(session[:host_id]))
    end
  end

  def new
    @host = Host.new
  end

  def create
    @host = Host.new(params[:host])
    if @host.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end


  def show

  end

end
