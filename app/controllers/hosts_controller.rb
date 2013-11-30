class HostsController < ApplicationController
  def index
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
end
